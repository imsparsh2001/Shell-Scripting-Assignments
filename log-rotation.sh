#!/bin/bash

# 3. Log Rotation Script
# Compress logs older than 3 days in /var/log/,
# move them to a backup directory, and delete all but the latest 3 backups.


log_dir="/var/log"
backup_dir="/var/log/backup_logs"

mkdir -p "$backup_dir"

find "$log_dir" -type f -mtime +3 ! -name "*.zip" | while read -r file; do
    zip -m "${file}.zip" "$file"
done

# Move zip files to backup directory
find "$log_dir" -type f -name "*.zip" -exec mv {} "$backup_dir" \;

# Delete zipped backups older than 30 days in backup directory
find "$backup_dir" -type f -name "*.zip" -mtime +30 -exec rm -f {} \;

