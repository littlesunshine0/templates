#!/bin/bash
# create_project_root.sh
# Creates the project root directory.

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

export PROJECT_NAME=$1
mkdir -p "$PROJECT_NAME"
echo "Project root directory '$PROJECT_NAME' created successfully."
