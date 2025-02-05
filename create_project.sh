#!/bin/bash
# create_project.sh
# Master script to create a modular project setup.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

export PROJECT_NAME=$1

# Step 1: Create the project root directory.
source ./create_project_root.sh "$PROJECT_NAME"

# Step 2: Create the project folders.
source ./create_project_folders.sh

# Step 3: Create essential files.
source ./create_project_files.sh

# Step 4: Create CRUD scripts for requirements.txt.
source ./create_crud_scripts.sh

echo "Project setup complete! Your new project '$PROJECT_NAME' is ready."
