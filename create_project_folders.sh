#!/bin/bash
# create_project_folders.sh
# Ensures necessary directories exist for the project.

if [ -z "$PROJECT_NAME" ]; then
    echo "Error: PROJECT_NAME variable is not set."
    exit 1
fi

echo "Creating project folders..."
mkdir -p "$PROJECT_NAME"/{framework/{utils,cli},scripts,examples,tests,docs}
echo "Folders created successfully."
