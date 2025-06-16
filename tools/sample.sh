#!/bin/bash

SERVER="dic_lab_02@192.168.88.31"
PASSWORD="sree@man"
REMOTE_BASE_DIR="sriman"

declare -A files_to_upload=(
    # ["zebra/sriman"]=""
    # ["zebra/Others"]=""
    ["zebra/sdc_tcl.sh"]=""  
)

for file in "${!files_to_upload[@]}"; do
    destination="${files_to_upload[$file]}"
    echo "Uploading $file to $SERVER:"
    sshpass -p "$PASSWORD" scp "$file" "$SERVER:"
done

echo "All files uploaded successfully!"
