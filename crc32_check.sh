#!/bin/bash

# Define the directory and checksum file
TARGET_DIR="/var/www/html"
CHECKSUM_FILE="/var/www/html/crc32_checksums.txt"
TMP_FILE="/tmp/crc32_verify.txt"

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Generate new CRC32 checksums
find "$TARGET_DIR" -type f ! -name "crc32_checksums.txt" -exec crc32 {} \; -exec echo " {}" \; | paste -d ' ' - - > "$TMP_FILE"

# Compare the saved checksums with the new ones
diff "$CHECKSUM_FILE" "$TMP_FILE" > /tmp/crc32_diff.txt

if [[ -s /tmp/crc32_diff.txt ]]; then
    echo "WARNING: Files have changed!"
    cat /tmp/crc32_diff.txt
else
    echo "All files are unchanged."
fi
