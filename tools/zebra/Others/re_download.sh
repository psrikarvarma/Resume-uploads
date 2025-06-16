#!/bin/bash
SERVER="192.168.88.31"
USER="dic_lab_02"
PASSWORD="sree@man"
REMOTE_DIR="/DIG_DESIGN/INTERNS/dic_lab_02"
LOCAL_DIR="$HOME/Downloads"

echo "Downloading sriman folder and runbash.sh file from $SERVER..."
sshpass -p "$PASSWORD" scp -r "$USER@$SERVER:$REMOTE_DIR/sriman" "$LOCAL_DIR"
sshpass -p "$PASSWORD" scp "$USER@$SERVER:$REMOTE_DIR/runbash.sh" "$LOCAL_DIR"

if [ $? -ne 0 ]; then
    echo "Failed to download files from the server."
    exit 1
fi

echo "Download completed successfully."
echo "Done."
