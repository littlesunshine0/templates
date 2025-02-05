#!/bin/bash
# modify_script.sh
# This script modifies an existing script by appending or replacing content.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <script_path> <update_marker>"
    exit 1
fi

SCRIPT_PATH="$1"
UPDATE_MARKER="$2"

if [ ! -f "$SCRIPT_PATH" ]; then
    echo "❌ Error: Script $SCRIPT_PATH does not exist."
    exit 1
fi

echo "🔄 Checking for modifications in $SCRIPT_PATH..."

# Check if the marker already exists in the script
if grep -q "$UPDATE_MARKER" "$SCRIPT_PATH"; then
    echo "✅ Update already applied: $UPDATE_MARKER found in $SCRIPT_PATH"
else
    echo "🔧 Applying update to $SCRIPT_PATH..."

    # Append the modification (example: adding a new function)
    cat << EOF >> "$SCRIPT_PATH"

# $UPDATE_MARKER - Added on $(date)
def new_function():
    \"\"\" A new function added dynamically \"\"\"
    print("Hello from the modified script!")
EOF

    echo "✅ Modification applied successfully!"
fi
