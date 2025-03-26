import copy
import json
import os
import re
import sys

plugin_file = "{0}-install.json"


def print_usage():
    usage = """
Usage:
    python update_metadata.py <plugin_name> <new_version>

Example:
    python update_metadata.py java 0.7.4
    python update_metadata.py html-report 1.2.3
"""
    print(usage)
    exit(1)


def update_version(url, old_version, new_version):
    return url.replace(old_version, new_version)


def update_urls(metadata, version):
    ov = metadata["version"]
    metadata["version"] = version
    urls = metadata["DownloadUrls"]
    for arch in urls:
        for platform in urls[arch]:
            new_url = update_version(urls[arch][platform], ov, version)
            urls[arch][platform] = new_url


def update_matada(plugin, version):
    file = plugin_file.format(plugin)
    with open(file, 'r') as f:
        data = json.load(f)
        metadata = copy.deepcopy(data["versions"][0])
        update_urls(metadata, version)
        data["versions"] = [metadata] + data["versions"]

    os.remove(file)

    with open(file, "w") as f:
        json.dump(data, f, indent=4)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print_usage()
    update_matada(sys.argv[1], sys.argv[2])
