#!/bin/bash
# 4. Basic Backup Automation
# Write a script to back up a specified directory (e.g., /etc) into a timestamped archive
# and store it in a backup folder.

# Taking source and target directory from user in the form of arguement 
source_dir=$1
target_dir=$2

timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir="${target_dir}/backup_${timestamp}"

function create_backup() {

    zip -r "${backup_dir}.zip" "${source_dir}" > /dev/null
    if [ $? -eq 0 ]; then
        echo "Backup created successfully"
    else
        echo "Backup was not performed for $timestamp"
    fi
} 

# function calling
create_backup