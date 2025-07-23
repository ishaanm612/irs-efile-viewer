#!/usr/bin/env python3
"""Utility helpers for converting IRS e-file XML returns to HTML and PDF.

The core logic is extracted from `main.py` so other scripts (e.g. the batch
pipeline) can reuse it without duplicating code.

Example
-------
>>> from transform_utils import transform_xml_to_pdf
>>> transform_xml_to_pdf(
...     xml_path="202400829349300020_public.xml",
...     pdf_path="out.pdf",
... )
returns a dict with metadata such as EIN, TaxYear, FormId.
"""

from __future__ import annotations

import argparse
import base64
import mimetypes
import os
import re
import sys
import tempfile
import xml.etree.ElementTree as ET
from pathlib import Path
from typing import Any, Dict, Optional

import boto3
from bs4 import BeautifulSoup
from dotenv import load_dotenv
from lxml import etree
from tqdm import tqdm

load_dotenv()

S3_BUCKET = os.getenv("S3_BUCKET_NAME")


class TransformError(Exception):
    """Custom exception for errors during XML transformation."""

    def __init__(self, message: str):
        super().__init__(message)
        self.message = message

    def __str__(self):
        return f"TransformError: {self.message}"


# ---------------------------------------------------------------------------
# Helper functions (mostly lifted from main.py)
# ---------------------------------------------------------------------------


def _remove_namespaces(xml_string: str) -> str:
    """Remove xmlns declarations so that XPath queries don’t need namespaces."""
    xml_string = re.sub(r"\s*xmlns:[^=]+=\"[^\"]*\"", "", xml_string)
    xml_string = re.sub(r"\s*xmlns=\"[^\"]*\"", "", xml_string)
    xml_string = re.sub(r"\s*xsi:schemaLocation=\"[^\"]*\"", "", xml_string)
    return xml_string


def _format_tin(tin: str | None) -> str | None:
    if not tin or len(tin) < 9:
        return tin
    return f"{tin[:2]}-{tin[2:]}"


def _format_date(date: str | None) -> str | None:
    if not date:
        return date
    return date.split("T")[0].replace(" ", "")


def _set_node_value(dom: etree._ElementTree, node_name: str, value: str | None) -> None:  # type: ignore[name-defined]
    node = dom.find(".//" + node_name)
    if node is not None and value is not None:
        node.text = value


def _move_header_and_main_form(input_dom: etree._ElementTree, template_dom: etree._ElementTree, form_id: str) -> None:  # type: ignore[name-defined]
    form_data = input_dom.find(".//" + form_id)
    form_header = input_dom.find(".//ReturnHeader")
    t_header = template_dom.find(".//ReturnHeader")
    t_data = template_dom.find(".//SubmissionDocument")
    if t_header is not None and form_header is not None:
        t_header.getparent().replace(t_header, form_header)
    if t_data is not None and form_data is not None:
        t_data.append(form_data)


def _get_stylesheet_path(stylesheet_root: str | Path, year: str, form_id: str) -> str:
    return os.path.join(str(stylesheet_root), year, f"{form_id}.xsl")


# ---------------------------------------------------------------------------
# Public API
# ---------------------------------------------------------------------------


def transform_xml_to_html(
    xml_path: str | Path,
    *,
    template_path: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml",
    stylesheet_root: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",
    form_id: Optional[str] = None,
) -> Dict[str, Any]:
    """Convert *xml_path* to HTML and return metadata & html bytes.

    Returns a dict::
        {
            "html": bytes,
            "ein": str | None,
            "tax_year": str | None,
            "form_id": str,
        }
    """
    xml_path = Path(xml_path)
    template_path = Path(template_path)
    stylesheet_root = Path(stylesheet_root)

    # 1. Load & clean XML
    clean_xml = _remove_namespaces(xml_path.read_text(encoding="utf-8"))
    input_dom = etree.fromstring(clean_xml.encode("utf-8"))

    # 2. Detect form id if not provided
    if form_id is None:
        return_data = input_dom.find(".//ReturnData")
        if return_data is None or len(return_data) == 0:
            raise ValueError("Could not determine form ID – ReturnData missing.")
        form_id = return_data[0].tag  # type: ignore[index]

    # 3. Prepare template DOM and merge
    template_dom = etree.parse(str(template_path))
    _move_header_and_main_form(input_dom, template_dom, form_id)

    # 4. Populate template parameters
    props_to_transfer = [
        ("/Return/@returnVersion", "ReturnVersion", None),
        ("/Return/@returnVersion", "SubmissionVersion", None),
        ("//ReturnHeader/TaxYr", "TaxYear", None),
        (
            "//ReturnHeader/ReturnTs|//ReturnHeader/Timestamp",
            "SystemMode",
            _format_date,
        ),
        (
            "//ReturnHeader/ReturnTypeCd|//ReturnHeader/ReturnType",
            "SubmissionType",
            None,
        ),
        ("//ReturnHeader/Filer/EIN", "TINLatest", _format_tin),
        ("//ReturnHeader/Filer/EIN", "TIN", _format_tin),
        (f"//{form_id}/@documentId", "DocumentId", None),
    ]

    for xpath, dest, transform in props_to_transfer:
        val = None
        if "|" in xpath:
            for xp in xpath.split("|"):
                try:
                    result = input_dom.xpath(xp.strip())
                    if result:
                        val = (
                            result[0].text
                            if isinstance(result[0], etree._Element)  # type: ignore[attr-defined, protected-access]
                            else result[0]
                        )
                        break
                except Exception:
                    continue
        else:
            try:
                result = input_dom.xpath(xpath)
                if result:
                    val = (
                        result[0].text
                        if isinstance(result[0], etree._Element)  # type: ignore[attr-defined, protected-access]
                        else result[0]
                    )
            except Exception:
                val = None
        if transform and val:
            val = transform(val)  # type: ignore[arg-type]
        _set_node_value(template_dom, dest, val)

    # 5. Resolve year and stylesheet
    year_node = template_dom.find(".//ReturnVersion")
    year = (
        re.search(r"\d{4}", year_node.text).group(0)  # type: ignore[arg-type]
        if year_node is not None and year_node.text
        else "2023"
    )
    stylesheet_path = _get_stylesheet_path(stylesheet_root, year, form_id)
    if not Path(stylesheet_path).is_file():
        raise FileNotFoundError(f"Stylesheet not found: {stylesheet_path}")

    # 6. Run XSLT
    tqdm.write(f"Running XSLT for {xml_path} with stylesheet {stylesheet_path}")
    xslt = etree.parse(stylesheet_path)
    transform = etree.XSLT(xslt)
    html_dom = transform(template_dom)
    html_bytes = etree.tostring(html_dom, pretty_print=True, method="html")

    # -------------------- Robust metadata extraction --------------------
    ns_irs = {"irs": "http://www.irs.gov/efile"}

    # Attempt namespaced retrieval first (original XML with namespaces)
    try:
        ns = {"irs": "http://www.irs.gov/efile"}
        tree = ET.parse(xml_path)
        root = tree.getroot()
        header = root.find(".//irs:ReturnHeader", ns)
        ein = None
        if header is not None:
            filer = header.find(".//irs:Filer", ns)
            if filer is not None:
                ein = filer.findtext(".//irs:EIN", namespaces=ns)
    except Exception:
        ein = None

    if not ein:
        # Primary non-namespaced path (after namespace removal)
        result = input_dom.xpath("//ReturnHeader/Filer/EIN/text()")
        if result:
            ein = result[0].strip()

    if not ein:
        # search 9-digit number inside Filer element
        filer_el = input_dom.find(".//Filer")
        if filer_el is not None:
            m = re.search(r"\b(\d{9})\b", etree.tostring(filer_el, encoding="unicode"))
            if m:
                ein = m.group(1)

    tax_year = None
    # 1) explicit TaxYr element (namespaced then non-ns)
    tax_year = input_dom.findtext(".//irs:TaxYr", namespaces=ns_irs)
    if tax_year:
        tax_year = tax_year.strip()

    if not tax_year:
        result = input_dom.xpath("//ReturnHeader/TaxYr/text()")
        if result:
            tax_year = result[0].strip()

    if not tax_year:
        # 2) year inside returnVersion attribute
        rv = input_dom.get("returnVersion") or ""
        m = re.search(r"(\d{4})", rv)
        if m:
            tax_year = m.group(1)
        else:
            # 3) year from TaxPeriodEndDt
            tax_year = input_dom.findtext(".//irs:TaxPeriodEndDt", namespaces=ns_irs)
            if not tax_year:
                result = input_dom.xpath("//ReturnHeader/TaxPeriodEndDt/text()")
                if result and len(result[0]) >= 4:
                    tax_year = result[0][:4]

    return {
        "html": html_bytes,
        "ein": ein,
        "tax_year": tax_year,
        "form_id": form_id,
    }


def transform_xml_to_pdf(
    xml_path: str | Path,
    output_path: str | Path,  # Can be a directory or a full path
    s3_bucket: str | None = None,
) -> Dict[str, Any]:
    """High-level helper that transforms *xml_path* to PDF saved at *pdf_path*.

    Returns the same metadata dict as `transform_xml_to_html` plus the final
    `pdf_path`.
    """
    try:
        meta = transform_xml_to_html(
            xml_path,
            template_path="/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml",  # Assuming template is in the same directory
            stylesheet_root="/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",  # Assuming stylesheets are in the same directory
        )
    except Exception as e:
        # tqdm.write(f"Error transforming XML to HTML: {e}")
        return TransformError(
            f"Error transforming XML to HTML: {e.with_traceback()} {xml_path}"
        )

    if not meta:
        return TransformError("No metadata found after transformation.")

    output_path = Path(output_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # ------------------------------------------------------------------
    # Create fully standalone HTML: inline CSS & images so no external files
    # ------------------------------------------------------------------

    html_bytes: bytes = meta["html"]  # type: ignore[assignment]

    declared_charset = "iso-8859-1"
    m = re.search(rb"charset=([A-Za-z0-9_-]+)", html_bytes[:200])
    if m:
        declared_charset = m.group(1).decode("ascii", "ignore")

    html_text = html_bytes.decode(declared_charset, errors="replace")

    repo_root = "/home/ec2-user/DonorAtlas/irs-efile-viewer"  # repo root absolute

    # Adjust root-relative paths first
    html_text = html_text.replace("/mef/", f"{repo_root}/mef/")

    # Write intermediate HTML to temp file
    with tempfile.NamedTemporaryFile(
        delete=False, suffix=".html", dir=Path(xml_path).parent
    ) as tmp:
        tmp.write(html_text.encode("utf-8"))
        tmp_path = Path(tmp.name)

    # --- standalone helpers copied from standalone.py ---

    def inline_css_imports_and_images(css_text: str, base_dir: Path) -> str:
        # inline @import
        css_text = re.sub(
            r"@import\s+url\(['\"]?(.*?)['\"]?\);",
            lambda m: (base_dir / m.group(1)).read_text("utf-8"),
            css_text,
        )

        def repl(match):
            p = base_dir / match.group(1)
            if not p.exists():
                return match.group(0)
            mime = mimetypes.guess_type(p)[0] or "application/octet-stream"
            data = base64.b64encode(p.read_bytes()).decode()
            return f"url(data:{mime};base64,{data})"

        return re.sub(r"url\(['\"]?(.*?)['\"]?\)", repl, css_text)

    def standalone_html(in_path: Path, out_path: Path):
        soup = BeautifulSoup(in_path.read_text("utf-8", errors="ignore"), "html.parser")

        # inline stylesheets
        for link in soup.find_all("link", rel="stylesheet"):
            href_str = link.get("href", "")
            if not href_str or href_str.startswith("http"):
                continue

            css_path = Path(href_str)
            if css_path.exists():
                css = css_path.read_text("utf-8", errors="ignore")
                css = inline_css_imports_and_images(css, css_path.parent)
                style = soup.new_tag("style")
                style.string = css
                link.replace_with(style)

        # inline images
        for img in soup.find_all("img", src=True):
            src_str = img.get("src", "")
            if src_str and not src_str.startswith("http"):
                src_path = Path(src_str)
                if src_path.exists():
                    mime = (
                        mimetypes.guess_type(src_path)[0] or "application/octet-stream"
                    )
                    data = base64.b64encode(src_path.read_bytes()).decode()
                    img["src"] = f"data:{mime};base64,{data}"

        # drop external JS
        for script in soup.find_all("script", src=True):
            script.decompose()

        out_path.write_text(str(soup), "utf-8")
        return out_path

    # Build filename based on EIN, tax year, form type
    ein = meta.get("ein") or "UNKNOWN"
    tax = meta.get("tax_year") or "UNKNOWN"
    form = meta.get("form_id") or "FORM"
    fname = f"{ein}_{tax}_{form}.html"
    output_html = output_path.parent / fname

    try:
        output_html = standalone_html(tmp_path, output_html)
    finally:
        tmp_path.unlink(missing_ok=True)

    meta["html_path"] = str(output_html)

    # Upload to S3 if requested
    key = output_html.name
    # if s3_bucket:
    #     s3 = boto3.client("s3")
    #     s3.upload_file(str(output_html), s3_bucket, key)
    #     # delete local file
    #     output_html.unlink(missing_ok=True)

    meta["s3_uri"] = f"s3://{s3_bucket}/{key}"

    return meta


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--xml-path", type=str, required=True)
    parser.add_argument("--output-path", type=str, required=True)
    parser.add_argument("--s3-bucket", type=str)
    args = parser.parse_args()

    res = transform_xml_to_pdf(
        xml_path=args.xml_path,
        output_path=Path(args.output_path),
        s3_bucket=args.s3_bucket,
    )

    if type(res).__name__ == "TransformError":
        tqdm.write(f"{res}")
        sys.exit(1)

    if "s3_uri" in res:
        tqdm.write(f"Uploaded to {res['s3_uri']}")
    else:
        tqdm.write(f"Standalone HTML: {res['html_path']}")
