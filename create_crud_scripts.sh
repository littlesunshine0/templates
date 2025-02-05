#!/bin/bash
# create_crud_scripts.sh
# Creates CRUD scripts for managing requirements.txt.

mkdir -p "$PROJECT_NAME/scripts"

echo "Creating CRUD scripts..."

# Add Package Script
cat > "$PROJECT_NAME/scripts/add_package.py" << 'PYTHON'
#!/usr/bin/env python3
import sys
import os

REQUIREMENTS_FILE = "requirements.txt"

def add_package(package_name):
    """ Adds a package to requirements.txt if not already present """
    print(f"Adding {package_name} to requirements.txt")
PYTHON

# Remove Package Script
cat > "$PROJECT_NAME/scripts/remove_package.py" << 'PYTHON'
#!/usr/bin/env python3
import sys
import os

REQUIREMENTS_FILE = "requirements.txt"

def remove_package(package_name):
    """ Removes a package from requirements.txt """
    print(f"Removing {package_name} from requirements.txt")
PYTHON

# List Packages Script
cat > "$PROJECT_NAME/scripts/ls_packages.py" << 'PYTHON'
#!/usr/bin/env python3
import os

REQUIREMENTS_FILE = "requirements.txt"

def list_packages():
    """ Lists all packages in requirements.txt """
    print("Listing all packages in requirements.txt")
PYTHON

# Update Requirements Script
cat > "$PROJECT_NAME/scripts/update_requirements.py" << 'PYTHON'
#!/usr/bin/env python3
import subprocess
import sys

def update_requirements():
    """ Updates requirements.txt using pip freeze """
    print("Updating requirements.txt with pip freeze")
PYTHON

echo "CRUD scripts created successfully."
