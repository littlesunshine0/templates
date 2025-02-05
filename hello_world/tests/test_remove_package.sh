#!/bin/bash
# Test script for remove_package.py

cd "hello_world"

echo "Running test: Removing 'requests' from requirements.txt..."
python3 scripts/remove_package.py requests

if grep -q "requests" requirements.txt; then
    echo "❌ Test Failed: 'requests' was NOT removed"
else
    echo "✅ Test Passed: 'requests' was removed from requirements.txt"
fi
