import argparse
import os
from pathlib import Path
import base64
import mimetypes
import re
import requests
from bs4 import BeautifulSoup


def standalone_html(input_html: Path, out_html: Path):
    soup = BeautifulSoup(input_html.read_text("utf-8"), "html.parser")

    # 1. inline <link rel="stylesheet">
    for link in soup.find_all("link", rel="stylesheet"):
        href = (input_html.parent / link["href"].lstrip("/")).resolve()
        css = href.read_text("utf-8")
        css = inline_css_imports_and_images(css, href.parent)
        style = soup.new_tag("style")
        style.string = css
        link.replace_with(style)

    # 2. inline <img src= …>
    for img in soup.find_all("img", src=True):
        src_path = (input_html.parent / img["src"].lstrip("/")).resolve()
        mime = mimetypes.guess_type(src_path)[0] or "application/octet-stream"
        data = base64.b64encode(src_path.read_bytes()).decode()
        img["src"] = f"data:{mime};base64,{data}"

    # 3. drop external JS (optional)
    for script in soup.find_all("script", src=True):
        script.decompose()

    out_html.write_text(str(soup), "utf-8")


def inline_css_imports_and_images(css_text, base_dir: Path):
    # inline @import
    css_text = re.sub(
        r"@import\s+url\(['\"]?(.*?)['\"]?\);",
        lambda m: base_dir.joinpath(m.group(1)).read_text("utf-8"),
        css_text,
    )

    # inline url(...) images
    def repl(m):
        p = base_dir / m.group(1)
        if not p.exists():
            return m.group(0)
        mime = mimetypes.guess_type(p)[0] or "application/octet-stream"
        data = base64.b64encode(p.read_bytes()).decode()
        return f"url(data:{mime};base64,{data})"

    css_text = re.sub(r"url\(['\"]?(.*?)['\"]?\)", repl, css_text)
    return css_text


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--html_path", type=str, required=True)
    args = parser.parse_args()

    standalone_html(
        Path(args.html_path),
        Path(os.path.basename(args.html_path).replace(".html", "_standalone.html")),
    )
