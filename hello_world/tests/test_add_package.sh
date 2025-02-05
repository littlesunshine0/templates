#!/bin/bash
# Test script for add_package.py

cd "hello_world"

echo "Running test: Adding 'requests' to requirements.txt..."
python3 scripts/add_package.py requests

if grep -q "requests" requirements.txt; then
    echo "✅ Test Passed: 'requests' was added to requirements.txt"
else
    echo "❌ Test Failed: 'requests' was NOT added"
fi
