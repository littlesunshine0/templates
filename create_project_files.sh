#!/bin/bash
# create_project_files.sh
# Ensures necessary files exist for the project.

if [ -z "$PROJECT_NAME" ]; then
    echo "Error: PROJECT_NAME variable is not set."
    exit 1
fi

echo "Creating project files..."
touch "$PROJECT_NAME"/{manage.py,requirements.txt,setup.py,README.md}
echo "Files created successfully."
