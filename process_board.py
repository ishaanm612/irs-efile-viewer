import json
import os
from donoratlas.names.parser import parse_name
import xml.etree.ElementTree as ET
from pathlib import Path
from concurrent.futures import ProcessPoolExecutor
import polars as pl
from tqdm import tqdm
import multiprocessing as mp

ein_map = {}
with open("ein_to_id.json", "r") as f:
    ein_map = json.load(f)


class NotInMapException(Exception):
    pass


def extract_board_from_xml(file_path: str):
    """
    Extract board member info from a single XML file.
    Returns a list of dicts: [{ein, file_name, name, title, compensated}]
    """
    try:
        ns = {"irs": "http://www.irs.gov/efile"}
        tree = ET.parse(file_path)
        root = tree.getroot()
        header = root.find(".//irs:ReturnHeader", ns)
        ein = None
        if header is not None:
            filer = header.find(".//irs:Filer", ns)
            if filer is not None:
                ein = filer.findtext(".//irs:EIN", namespaces=ns)
        form_990 = root.find(".//irs:IRS990", ns)
        if form_990 is None:
            return []
        board_members = []
        for member in form_990.findall(".//irs:Form990PartVIISectionAGrp", ns):
            name = member.findtext(".//irs:PersonNm", namespaces=ns)
            title = member.findtext(".//irs:TitleTxt", namespaces=ns)
            comp = member.findtext(".//irs:ReportableCompFromOrgAmt", namespaces=ns)
            comRel = member.findtext(
                ".//irs:ReportableCompFromRltdOrgAmt", namespaces=ns
            )
            parsed_name = parse_name(name)
            # Consider compensated if comp is not None and > 0
            try:
                compensated = (float(comp) > 0 if comp is not None else False) or (
                    float(comRel) > 0 if comRel is not None else False
                )
            except Exception:
                compensated = False
            if ein not in ein_map:
                raise NotInMapException()
            board_members.append(
                {
                    "npo_id": ein_map[ein],
                    "file_name": Path(file_path).name,
                    "first_name": parsed_name.first,
                    "middle_name": parsed_name.middle,
                    "last_name": parsed_name.last,
                    "suffix": parsed_name.suffix,
                    "name_title": parsed_name.title,
                    "title": title,
                    "compensated": compensated,
                }
            )

        return board_members
    except NotInMapException:
        return {"type": "not_in_map", "ein": ein, "file_path": file_path}
    except Exception:
        return []


def batched_file_generator(directory, batch_size):
    batch = []
    for file in Path(directory).rglob("*.xml"):
        batch.append(file)
        if len(batch) == batch_size:
            yield batch
            batch = []
    if batch:
        yield batch


def main():
    import sys

    if len(sys.argv) < 2:
        print("Usage: python process_board.py <xml_directory> [output_csv]")
        return
    xml_directory = sys.argv[1]
    output_csv = sys.argv[2] if len(sys.argv) > 2 else "board_members.csv"
    batch_size = 25000
    max_workers = min(mp.cpu_count() - 1, 8)
    all_board_members = []
    not_in_map_count = 0
    not_in_map = []
    total_files = sum(1 for _ in Path(xml_directory).rglob("*.xml"))
    print(f"Processing {total_files} XML files with {max_workers} workers...")
    with ProcessPoolExecutor(max_workers=max_workers) as executor:
        with tqdm(
            total=total_files, desc="Processing files", unit="file", leave=False
        ) as pbar:
            for batch_files in batched_file_generator(xml_directory, batch_size):
                # Use executor.map as an iterator for smoother progress
                for board_list in executor.map(
                    extract_board_from_xml, [str(f) for f in batch_files]
                ):
                    if (
                        isinstance(board_list, dict)
                        and board_list.get("type") == "not_in_map"
                    ):
                        not_in_map_count += 1
                        not_in_map.append((board_list["ein"], board_list["file_path"]))
                    else:
                        all_board_members.extend(board_list)
                    pbar.update(1)
    if all_board_members:
        df = pl.DataFrame(all_board_members)
        df.write_csv(output_csv)
        print(f"Board member data written to {output_csv}")
        print(f"Not in map: {not_in_map_count}")
        with open(
            f"results/nmap/not_in_map_{output_csv.split('_')[0].split('/')[-1]}.csv",
            "w",
        ) as ff:
            for ein, file_path in not_in_map:
                ff.write(f"{ein},{file_path}\n")
    else:
        print("No board member data found.")


if __name__ == "__main__":
    main()
