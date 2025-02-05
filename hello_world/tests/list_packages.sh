#!/bin/bash
# Test script for ls_packages.py

cd "hello_world"

echo "Running test: Listing packages in requirements.txt..."
python3 scripts/ls_packages.py > output.txt

if grep -q "requests" output.txt; then
    echo "✅ Test Passed: 'requests' was listed"
else
    echo "❌ Test Failed: 'requests' was NOT listed"
fi

rm output.txt
