#!/bin/bash
# generate_test_script.sh
# Generates test scripts for a specific script or all scripts in `scripts/`

PROJECT_NAME="hello_world"
TESTS_DIR="tests"
SCRIPTS_DIR="scripts"

mkdir -p "$TESTS_DIR"  # Ensure the tests directory exists

generate_test() {
    local SCRIPT_NAME="$1"
    local TEST_NAME="test_${SCRIPT_NAME}.sh"
    local TEST_FILE="${TESTS_DIR}/${TEST_NAME}"

    echo "Generating test file: $TEST_FILE"

    case "$SCRIPT_NAME" in
        "add_package.py")
            cat > "$TEST_FILE" << EOF2
#!/bin/bash
# Test script for $SCRIPT_NAME

cd "$PROJECT_NAME"

echo "Running test: Adding 'requests' to requirements.txt..."
python3 scripts/$SCRIPT_NAME requests

if grep -q "requests" requirements.txt; then
    echo "✅ Test Passed: 'requests' was added to requirements.txt"
else
    echo "❌ Test Failed: 'requests' was NOT added"
fi
EOF2
            ;;
        
        "remove_package.py")
            cat > "$TEST_FILE" << EOF2
#!/bin/bash
# Test script for $SCRIPT_NAME

cd "$PROJECT_NAME"

echo "Running test: Removing 'requests' from requirements.txt..."
python3 scripts/$SCRIPT_NAME requests

if grep -q "requests" requirements.txt; then
    echo "❌ Test Failed: 'requests' was NOT removed"
else
    echo "✅ Test Passed: 'requests' was removed from requirements.txt"
fi
EOF2
            ;;

        "ls_packages.py")
            cat > "$TEST_FILE" << EOF2
#!/bin/bash
# Test script for $SCRIPT_NAME

cd "$PROJECT_NAME"

echo "Running test: Listing packages in requirements.txt..."
python3 scripts/$SCRIPT_NAME > output.txt

if grep -q "requests" output.txt; then
    echo "✅ Test Passed: 'requests' was listed"
else
    echo "❌ Test Failed: 'requests' was NOT listed"
fi

rm output.txt
EOF2
            ;;

        "update_requirements.py")
            cat > "$TEST_FILE" << EOF2
#!/bin/bash
# Test script for $SCRIPT_NAME

cd "$PROJECT_NAME"

echo "Running test: Updating requirements.txt..."
python3 scripts/$SCRIPT_NAME

if [[ -s requirements.txt ]]; then
    echo "✅ Test Passed: requirements.txt was updated"
else
    echo "❌ Test Failed: requirements.txt is empty"
fi
EOF2
            ;;
        
        *)
            echo "❌ No test case defined for $SCRIPT_NAME"
            return
            ;;
    esac

    chmod +x "$TEST_FILE"
    echo "✅ Test script created: $TEST_FILE"
}

# Check for arguments
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <script_name.py> or 'all'"
    exit 1
fi

# Generate test for all scripts
if [ "$1" == "all" ]; then
    for SCRIPT in "$SCRIPTS_DIR"/*.py; do
        SCRIPT_NAME=$(basename "$SCRIPT")
        generate_test "$SCRIPT_NAME"
    done
    echo "✅ All test scripts generated successfully."
    exit 0
fi

# Generate test for a single script
generate_test "$1"
