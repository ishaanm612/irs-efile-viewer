#!/usr/bin/env python3
"""Utility helpers for converting IRS e-file XML returns to HTML and PDF.

This module provides core functionality for transforming IRS e-file XML documents
into HTML and PDF formats. The transformation process involves:

1. XML preprocessing (namespace removal, cleaning)
2. Template-based form generation
3. XSLT transformation using IRS-provided stylesheets
4. Standalone HTML generation with inlined CSS and images
5. Metadata extraction (EIN, tax year, form types)

The core logic is extracted from `main.py` so other scripts (e.g. the batch
pipeline) can reuse it without duplicating code.

Example
-------
>>> from transform_utils import transform_xml_to_html
>>> result = transform_xml_to_html(
...     xml_path="202400829349300020_public.xml",
...     form_id="IRS990"
... )
>>> print(f"EIN: {result['ein']}, Year: {result['tax_year']}")
"""

from __future__ import annotations

import argparse
import base64
import mimetypes
import os
import re
import sys
import tempfile
from typing_extensions import deprecated
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
    """Custom exception for errors during XML transformation.

    This exception is raised when errors occur during the XML to HTML/PDF
    transformation process. It includes a descriptive message about what
    went wrong.

    Parameters
    ----------
    message : str
        Descriptive error message explaining the transformation failure

    Attributes
    ----------
    message : str
        The error message passed to the constructor
    """

    def __init__(self, message: str):
        super().__init__(message)
        self.message = message

    def __str__(self):
        return f"TransformError: {self.message}"


# ---------------------------------------------------------------------------
# Helper functions (mostly lifted from main.py)
# ---------------------------------------------------------------------------


def _remove_namespaces(xml_string: str) -> str:
    """Remove xmlns declarations so that XPath queries don't need namespaces.

    IRS XML files contain namespace declarations that can complicate XPath
    queries. This function removes these declarations to simplify processing.

    Parameters
    ----------
    xml_string : str
        Raw XML string with namespace declarations

    Returns
    -------
    str
        XML string with namespace declarations removed

    Notes
    -----
    Removes xmlns, xmlns:*, and xsi:schemaLocation attributes from the XML.
    This allows XPath queries to work without namespace prefixes.
    """
    xml_string = re.sub(r"\s*xmlns:[^=]+=\"[^\"]*\"", "", xml_string)
    xml_string = re.sub(r"\s*xmlns=\"[^\"]*\"", "", xml_string)
    xml_string = re.sub(r"\s*xsi:schemaLocation=\"[^\"]*\"", "", xml_string)
    return xml_string


def _format_tin(tin: str | None) -> str | None:
    """Format TIN (Taxpayer Identification Number) with dashes.

    Converts a 9-digit TIN to the standard format with dashes (XX-XXXXXXX).

    Parameters
    ----------
    tin : str or None
        Raw TIN string (e.g., "123456789")

    Returns
    -------
    str or None
        Formatted TIN (e.g., "12-3456789") or None if input is None/empty

    Notes
    -----
    Only formats TINs that are at least 9 digits long. Returns the original
    value for shorter strings or None values.
    """
    if not tin or len(tin) < 9:
        return tin
    return f"{tin[:2]}-{tin[2:]}"


def _format_date(date: str | None) -> str | None:
    """Format date string by removing time component.

    Extracts just the date portion from a datetime string, removing
    the time component and any extra spaces.

    Parameters
    ----------
    date : str or None
        Date string that may contain time component (e.g., "2023-01-01T00:00:00")

    Returns
    -------
    str or None
        Date-only string (e.g., "2023-01-01") or None if input is None/empty

    Notes
    -----
    Splits on 'T' to separate date and time, then removes any spaces.
    """
    if not date:
        return date
    return date.split("T")[0].replace(" ", "")


def _set_node_value(dom: etree._ElementTree, node_name: str, value: str | None) -> None:  # type: ignore[name-defined]
    """Set the text value of an XML node in the DOM.

    Finds a node by name in the DOM and sets its text content if the node
    exists and the value is not None.

    Parameters
    ----------
    dom : etree._ElementTree
        XML DOM tree to modify
    node_name : str
        Name of the node to find and update
    value : str or None
        New text value to set, or None to leave unchanged

    Notes
    -----
    Uses XPath-like syntax to find nodes. Only updates the node if both
    the node exists and the value is not None.
    """
    node = dom.find(".//" + node_name)
    if node is not None and value is not None:
        node.text = value


def _move_header_and_main_form(input_dom: etree._ElementTree, template_dom: etree._ElementTree, form_id: str) -> None:  # type: ignore[name-defined]
    """Move header and main form data from input DOM to template DOM.

    Extracts the ReturnHeader and specified form from the input XML and
    merges them into the template XML structure.

    Parameters
    ----------
    input_dom : etree._ElementTree
        Source XML DOM containing the form data
    template_dom : etree._ElementTree
        Template XML DOM to receive the form data
    form_id : str
        Name of the form to extract (e.g., "IRS990")

    Notes
    -----
    This function modifies the template_dom in place. It replaces the
    ReturnHeader in the template with the one from input_dom, and appends
    the specified form to the SubmissionDocument section.
    """
    form_data = input_dom.find(".//" + form_id)
    form_header = input_dom.find(".//ReturnHeader")
    t_header = template_dom.find(".//ReturnHeader")
    t_data = template_dom.find(".//SubmissionDocument")
    if t_header is not None and form_header is not None:
        t_header.getparent().replace(t_header, form_header)
    if t_data is not None and form_data is not None:
        t_data.append(form_data)


def _get_stylesheet_path(stylesheet_root: str | Path, year: str, form_id: str) -> str:
    """Construct the path to the XSLT stylesheet for a specific form and year.

    Parameters
    ----------
    stylesheet_root : str or Path
        Root directory containing stylesheet folders
    year : str
        Tax year (e.g., "2023")
    form_id : str
        Form identifier (e.g., "IRS990")

    Returns
    -------
    str
        Full path to the XSLT stylesheet file

    Notes
    -----
    Constructs path as: {stylesheet_root}/{year}/{form_id}.xsl
    """
    return os.path.join(str(stylesheet_root), year, f"{form_id}.xsl")


def _make_html_standalone(html_bytes: bytes) -> bytes:
    """Convert HTML to standalone format with inlined CSS and images.

    Processes HTML to make it completely self-contained by:
    1. Inlining all CSS stylesheets
    2. Converting images to base64 data URLs
    3. Removing external JavaScript references

    Parameters
    ----------
    html_bytes : bytes
        Raw HTML bytes to process

    Returns
    -------
    bytes
        Standalone HTML bytes with all external dependencies inlined

    Notes
    -----
    Creates a temporary file for processing, then uses BeautifulSoup to
    parse and modify the HTML. All CSS and images are converted to data URLs
    to make the HTML completely self-contained.
    """
    declared_charset = "iso-8859-1"
    m = re.search(rb"charset=([A-Za-z0-9_-]+)", html_bytes[:200])
    if m:
        declared_charset = m.group(1).decode("ascii", "ignore")

    html_text = html_bytes.decode(declared_charset, errors="replace")

    repo_root = "/home/ec2-user/DonorAtlas/irs-efile-viewer"  # repo root absolute

    # Adjust root-relative paths first
    html_text = html_text.replace("/mef/", f"{repo_root}/mef/")

    # Create temporary HTML file for processing
    with tempfile.NamedTemporaryFile(
        delete=False, suffix=".html", mode="w", encoding="utf-8"
    ) as tmp:
        tmp.write(html_text)
        tmp_path = Path(tmp.name)

    try:
        # Apply standalone conversion
        soup = BeautifulSoup(
            tmp_path.read_text("utf-8", errors="ignore"), "html.parser"
        )

        # inline stylesheets
        for link in soup.find_all("link", rel="stylesheet"):
            href_str = link.get("href", "")
            if not href_str or href_str.startswith("http"):
                continue

            css_path = Path(href_str)
            if css_path.exists():
                css = css_path.read_text("utf-8", errors="ignore")
                css = _inline_css_imports_and_images(css, css_path.parent)
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

        standalone_html = str(soup)
        return standalone_html.encode("utf-8")

    finally:
        tmp_path.unlink(missing_ok=True)


def _inline_css_imports_and_images(css_text: str, base_dir: Path) -> str:
    """Inline CSS @import statements and convert images to data URLs.

    Processes CSS text to:
    1. Replace @import statements with the actual CSS content
    2. Convert image URLs to base64 data URLs

    Parameters
    ----------
    css_text : str
        Raw CSS text to process
    base_dir : Path
        Base directory for resolving relative paths

    Returns
    -------
    str
        Processed CSS with imports inlined and images converted to data URLs

    Notes
    -----
    Uses regex to find @import statements and url() references, then
    reads the referenced files and converts them to data URLs.
    """
    # inline @import
    css_text = re.sub(
        r"@import\s+url\(['\"]?(.*?)['\"]?\);",
        lambda m: (
            (base_dir / m.group(1)).read_text("utf-8")
            if (base_dir / m.group(1)).exists()
            else ""
        ),
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
    """Convert XML file to HTML and return metadata & html bytes.

    This is the main transformation function that converts IRS XML files
    to HTML format. It handles the complete pipeline from XML parsing
    through XSLT transformation to final HTML generation.

    Parameters
    ----------
    xml_path : str or Path
        Path to the XML file to transform
    template_path : str or Path, optional
        Path to the form template XML file, defaults to form_template.xml
    stylesheet_root : str or Path, optional
        Root directory containing XSLT stylesheets, defaults to mef/Stylesheets
    form_id : str or None, optional
        Specific form to process (e.g., "IRS990"). If None, auto-detects
        the first form in ReturnData section.

    Returns
    -------
    Dict[str, Any]
        Dictionary containing:
        - html: bytes - The generated HTML content
        - ein: str or None - Employer Identification Number
        - tax_year: str or None - Tax year of the filing
        - form_id: str - The form that was processed

    Raises
    ------
    ValueError
        If form_id cannot be determined from XML
    FileNotFoundError
        If required template or stylesheet files are missing

    Notes
    -----
    The function automatically detects the form type if not specified,
    extracts metadata from the XML, and applies the appropriate XSLT
    transformation. The resulting HTML is not standalone (external
    CSS and images are referenced).

    Example
    -------
    >>> result = transform_xml_to_html("filing.xml", form_id="IRS990")
    >>> print(f"Processed {result['form_id']} for EIN {result['ein']}")
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
    # tqdm.write(f"Running XSLT for {xml_path} with stylesheet {stylesheet_path}")
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


def get_forms_list(xml_path: str | Path) -> list[str]:
    """Extract all form names from XML ReturnData section.

    Similar to JS getListOfForms() - returns list of form tag names
    like ['IRS990', 'IRS990ScheduleA', 'IRS990ScheduleB', ...]

    Parameters
    ----------
    xml_path : str or Path
        Path to the XML file to analyze

    Returns
    -------
    list[str]
        List of form names found in ReturnData section

    Notes
    -----
    Loads and cleans the XML, then extracts all child element tag names
    from the ReturnData section. Returns empty list if ReturnData is
    missing or if an error occurs during processing.

    Example
    -------
    >>> forms = get_forms_list("filing.xml")
    >>> print(f"Found forms: {forms}")
    """
    xml_path = Path(xml_path)

    try:
        # Load & clean XML
        clean_xml = _remove_namespaces(xml_path.read_text(encoding="utf-8"))
        input_dom = etree.fromstring(clean_xml.encode("utf-8"))

        # Find ReturnData element
        return_data = input_dom.find(".//ReturnData")
        if return_data is None:
            return []

        # Extract all child element tag names
        return [child.tag for child in return_data]

    except Exception as e:
        print(f"Error extracting forms from {xml_path}: {e}")
        return []


def transform_xml_to_standalone_html(
    xml_path: str | Path,
    form_id: str,
    *,
    template_path: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml",
    stylesheet_root: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",
) -> Dict[str, Any]:
    """Generate standalone HTML for a specific form.

    Always generates standalone HTML with inlined CSS/images for all forms.
    This function is similar to transform_xml_to_html but always produces
    standalone HTML that can be viewed without external dependencies.

    Parameters
    ----------
    xml_path : str or Path
        Path to the XML file to transform
    form_id : str
        Specific form to process (e.g., 'IRS990', 'IRS990ScheduleA')
    template_path : str or Path, optional
        Path to the form template XML, defaults to form_template.xml
    stylesheet_root : str or Path, optional
        Root directory containing XSLT stylesheets, defaults to mef/Stylesheets

    Returns
    -------
    Dict[str, Any]
        Dictionary containing:
        - html: bytes - Standalone HTML content with inlined CSS/images
        - ein: str or None - Employer Identification Number
        - tax_year: str or None - Tax year of the filing
        - form_id: str - The form that was processed

    Raises
    ------
    ValueError
        If the specified form_id is not found in the XML
    FileNotFoundError
        If required template or stylesheet files are missing

    Notes
    -----
    The resulting HTML is completely self-contained with all CSS and images
    inlined as data URLs. This makes it suitable for distribution or
    viewing without external dependencies.

    Example
    -------
    >>> result = transform_xml_to_standalone_html("filing.xml", "IRS990")
    >>> with open("output.html", "wb") as f:
    ...     f.write(result["html"])
    """
    xml_path = Path(xml_path)
    template_path = Path(template_path)
    stylesheet_root = Path(stylesheet_root)

    # 1. Load & clean XML
    clean_xml = _remove_namespaces(xml_path.read_text(encoding="utf-8"))
    input_dom = etree.fromstring(clean_xml.encode("utf-8"))

    # 2. Verify form exists
    form_element = input_dom.find(f".//{form_id}")
    if form_element is None:
        raise ValueError(f"Form {form_id} not found in {xml_path}")

    # 3. Prepare template DOM and merge
    template_dom = etree.parse(str(template_path))
    _move_header_and_main_form(input_dom, template_dom, form_id)

    # 4. Populate template parameters (reuse existing logic)
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
    xslt = etree.parse(stylesheet_path)
    transform = etree.XSLT(xslt)
    html_dom = transform(template_dom)
    html_bytes = etree.tostring(html_dom, pretty_print=True, method="html")

    # 7. Convert to standalone HTML (always for all forms)
    html_bytes = _make_html_standalone(html_bytes)

    # 7. Extract metadata (reuse existing logic)
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


def generate_html_files_for_xml(
    xml_path: str | Path,
    output_dir: str | Path,
    *,
    template_path: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml",
    stylesheet_root: (
        str | Path
    ) = "/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",
    s3_bucket: str | None = None,
) -> Dict[str, Any]:
    """Generate HTML files for all forms in an XML file.

    Processes an XML file and generates standalone HTML files for each form
    found in the ReturnData section. Each form gets its own HTML file with
    a standardized naming convention.

    Parameters
    ----------
    xml_path : str or Path
        Path to the XML file to process
    output_dir : str or Path
        Directory where HTML files will be saved
    template_path : str or Path, optional
        Path to the form template XML, defaults to form_template.xml
    stylesheet_root : str or Path, optional
        Root directory containing XSLT stylesheets, defaults to mef/Stylesheets
    s3_bucket : str or None, optional
        S3 bucket name for generating S3 URIs (no actual upload performed)

    Returns
    -------
    Dict[str, Any]
        Dictionary containing:
        - xml_path: str - Path to the processed XML file
        - ein: str or None - Employer Identification Number
        - tax_year: str or None - Tax year of the filing
        - generated_files: list - List of file information dictionaries
        - errors: list - List of error messages encountered
        - total_forms: int - Total number of forms found
        - successful_forms: int - Number of forms successfully processed

    Notes
    -----
    Creates the output directory if it doesn't exist. File naming convention:
    {EIN}_{TAX_YEAR}_{FORM_ID}.html

    Each generated file info includes:
    - form_id: Form type (e.g., "IRS990")
    - filename: Generated filename
    - path: Local file path (if s3_bucket is None)
    - s3_uri: S3 URI (if s3_bucket is provided)
    - ein: Employer Identification Number
    - tax_year: Tax year

    Example
    -------
    >>> result = generate_html_files_for_xml("filing.xml", "output/")
    >>> print(f"Generated {result['successful_forms']} HTML files")
    """
    xml_path = Path(xml_path)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Get all forms in the XML
    forms = get_forms_list(xml_path)
    if not forms:
        return {"error": f"No forms found in {xml_path}", "generated_files": []}

    generated_files = []
    errors = []
    ein = None
    tax_year = None

    for form_id in forms:
        try:
            # Generate standalone HTML for this form
            meta = transform_xml_to_standalone_html(
                xml_path,
                form_id,
                template_path=template_path,
                stylesheet_root=stylesheet_root,
            )

            # Extract common metadata from first successful form
            if ein is None:
                ein = meta.get("ein", "UNKNOWN")
            if tax_year is None:
                tax_year = meta.get("tax_year", "UNKNOWN")

            # Build filename: {EIN}_{TAX_YEAR}_{FORM_ID}.html
            filename = f"{ein}_{tax_year}_{form_id}.html"
            output_file = output_dir / filename

            # Write standalone HTML file
            html_content = meta["html"].decode("utf-8", errors="replace")
            output_file.write_text(html_content, encoding="utf-8")

            # Upload to S3 if requested
            s3_uri = None
            s3_uri = f"s3://{s3_bucket}/{filename}"

            generated_files.append(
                {
                    "form_id": form_id,
                    "filename": filename,
                    "path": str(output_file) if not s3_bucket else None,
                    "s3_uri": s3_uri,
                    "ein": ein,
                    "tax_year": tax_year,
                }
            )

        except Exception as e:
            errors.append(f"Error processing {form_id}: {str(e)}")

    return {
        "xml_path": str(xml_path),
        "ein": ein,
        "tax_year": tax_year,
        "generated_files": generated_files,
        "errors": errors,
        "total_forms": len(forms),
        "successful_forms": len(generated_files),
    }


@deprecated("Use transform_xml_to_html instead")
def transform_xml_to_pdf(
    xml_path: str | Path,
    output_path: str | Path,  # Can be a directory or a full path
    s3_bucket: str | None = None,
) -> Dict[str, Any]:
    """High-level helper that transforms XML to PDF saved at output_path.

    This function is deprecated. Use transform_xml_to_html instead for
    HTML generation, or implement PDF generation separately.

    Parameters
    ----------
    xml_path : str or Path
        Path to the XML file to transform
    output_path : str or Path
        Output path for the generated file (can be directory or full path)
    s3_bucket : str or None, optional
        S3 bucket name for generating S3 URIs

    Returns
    -------
    Dict[str, Any]
        Dictionary containing metadata about the transformation, including:
        - html_path: str - Path to the generated HTML file
        - s3_uri: str - S3 URI for the generated file
        - ein: str or None - Employer Identification Number
        - tax_year: str or None - Tax year of the filing
        - form_id: str - The form that was processed

    Notes
    -----
    This function actually generates HTML files, not PDF files, despite
    the function name. It's kept for backward compatibility but is
    deprecated in favor of transform_xml_to_html.

    The function creates standalone HTML with inlined CSS and images,
    then saves it to the specified output path.
    """
    try:
        meta = transform_xml_to_html(
            xml_path,
            template_path="/home/ec2-user/DonorAtlas/irs-efile-viewer/form_template.xml",  # Assuming template is in the same directory
            stylesheet_root="/home/ec2-user/DonorAtlas/irs-efile-viewer/mef/Stylesheets",  # Assuming stylesheets are in the same directory
        )
    except Exception as e:
        # tqdm.write(f"Error transforming XML to HTML: {e}")
        return TransformError(f"Error transforming XML to HTML: {str(e)} {xml_path}")

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
    parser = argparse.ArgumentParser(
        description="Transform IRS XML files to HTML or PDF"
    )
    parser.add_argument("--xml-path", type=str, required=True, help="Path to XML file")
    parser.add_argument(
        "--output-dir", type=str, help="Output directory for HTML generation"
    )
    parser.add_argument("--s3-bucket", type=str, help="S3 bucket for uploads")

    args = parser.parse_args()

    if not args.output_dir:
        tqdm.write("Error: --output-dir is required for HTML generation")
        sys.exit(1)

    res = generate_html_files_for_xml(
        xml_path=args.xml_path,
        output_dir=args.output_dir,
        s3_bucket=args.s3_bucket,
    )

    if "error" in res:
        tqdm.write(f"Error: {res['error']}")
        sys.exit(1)

    if args.s3_bucket:
        tqdm.write(
            f"Generated and uploaded {res['successful_forms']}/{res['total_forms']} standalone HTML files to S3:"
        )
        for file_info in res["generated_files"]:
            if file_info.get("s3_uri"):
                tqdm.write(f"  - {file_info['s3_uri']} ({file_info['form_id']})")
            else:
                tqdm.write(
                    f"  - {file_info['filename']} ({file_info['form_id']}) - UPLOAD FAILED"
                )
    else:
        tqdm.write(
            f"Generated {res['successful_forms']}/{res['total_forms']} standalone HTML files:"
        )
        for file_info in res["generated_files"]:
            tqdm.write(f"  - {file_info['filename']} ({file_info['form_id']})")

    if res["errors"]:
        tqdm.write("Errors encountered:")
        for error in res["errors"]:
            tqdm.write(f"  - {error}")
