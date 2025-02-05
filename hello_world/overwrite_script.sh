#!/bin/bash
# overwrite_script.sh
# Completely overwrites an existing file with new content.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_path> <new_content_marker>"
    exit 1
fi

FILE_PATH="$1"
NEW_MARKER="$2"

echo "🚀 Overwriting $FILE_PATH..."

# Overwrite the file with new content
cat > "$FILE_PATH" << EOF
#!/usr/bin/env python3
# $NEW_MARKER - Overwritten on $(date)

def main():
    \"\"\" This script was completely rewritten. \"\"\"
    print("Hello! This is the new version of the script.")

if __name__ == "__main__":
    main()
EOF

echo "✅ Successfully overwritten: $FILE_PATH"
