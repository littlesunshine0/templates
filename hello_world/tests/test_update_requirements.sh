#!/bin/bash
# Test script for update_requirements.py

cd "hello_world"

echo "Running test: Updating requirements.txt..."
python3 scripts/update_requirements.py

if [[ -s requirements.txt ]]; then
    echo "✅ Test Passed: requirements.txt was updated"
else
    echo "❌ Test Failed: requirements.txt is empty"
fi
