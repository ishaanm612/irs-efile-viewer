#!/usr/bin/env python3
"""Strip Jekyll/GitHub-Pages front-matter blocks (e.g. leading `---` … `---`) from
all .xsl files under the provided directory.  Operates **in-place** but creates
an automatic backup with a `.bak` extension the first time it touches a file.

Usage:
    python remove_front_matter.py /path/to/Stylesheets

If no directory is given, the current working directory is used.
"""

import argparse
import os
from pathlib import Path
from typing import List


def strip_front_matter(lines: List[str]) -> List[str]:
    """Return *lines* with everything before the XML declaration removed.

    The function scans for the first line that begins with '<?xml' *or*
    '<xsl:stylesheet' (to cover cases where the XML declaration is absent).
    Everything before that line is considered front-matter and discarded.
    """
    for idx, line in enumerate(lines):
        stripped = line.lstrip()
        if stripped.startswith("<?xml") or stripped.startswith("<xsl:stylesheet"):
            return lines[idx:]  # keep from this line onwards
    # If no XML/XSL root found, return original content unchanged
    return lines


def process_file(path: Path) -> None:
    with path.open("r", encoding="utf-8") as f:
        original_lines = f.readlines()

    cleaned_lines = strip_front_matter(original_lines)

    # Only write back if something changed
    if cleaned_lines != original_lines:
        backup_path = path.with_suffix(path.suffix + ".bak")
        if not backup_path.exists():
            path.rename(backup_path)
        else:
            # overwrite existing backup if already made earlier
            backup_path.write_text("".join(original_lines), encoding="utf-8")

        path.write_text("".join(cleaned_lines), encoding="utf-8")
        print(f"Cleaned {path.relative_to(start_dir)} (backup: {backup_path.name})")


def main() -> None:
    parser = argparse.ArgumentParser(description="Remove front-matter from XSL files.")
    parser.add_argument(
        "directory",
        nargs="?",
        default=".",
        help="Root Stylesheets directory (defaults to current directory)",
    )
    args = parser.parse_args()

    global start_dir
    start_dir = Path(args.directory).resolve()
    if not start_dir.is_dir():
        raise SystemExit(f"Directory not found: {start_dir}")

    for path in start_dir.rglob("*.xsl"):
        process_file(path)


if __name__ == "__main__":
    main()
