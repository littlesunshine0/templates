#!/usr/bin/env python3
import sys
import os

REQUIREMENTS_FILE = "requirements.txt"

def remove_package(package_name):
    """ Removes a package from requirements.txt """
    print(f"Removing {package_name} from requirements.txt")
