import sys
import json


def count_entries(json_path):
    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    total = 0
    for v in data.values():
        if isinstance(v, list):
            total += len(v)
        else:
            # Defensive: if not a list, count as 1 (shouldn't happen in our summaries)
            total += 1
    return total


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python count_num_entries.py <summary.json>")
        sys.exit(1)
    json_path = sys.argv[1]
    print(count_entries(json_path))
