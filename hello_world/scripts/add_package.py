#!/usr/bin/env python3
import sys
import os

REQUIREMENTS_FILE = "requirements.txt"

def add_package(package_name):
    """ Adds a package to requirements.txt if not already present """
    if os.path.exists(REQUIREMENTS_FILE):
        with open(REQUIREMENTS_FILE, "r") as f:
            lines = [line.strip() for line in f if line.strip()]
    else:
        lines = []

    if package_name in lines:
        print(f"{package_name} is already in {REQUIREMENTS_FILE}.")
        return

    with open(REQUIREMENTS_FILE, "a") as f:
        f.write(package_name + "\n")
    print(f"Added {package_name} to {REQUIREMENTS_FILE}.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 add_package.py <package>")
        sys.exit(1)
    add_package(sys.argv[1])
