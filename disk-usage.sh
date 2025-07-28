#!/bin/bash

# 2. Disk Usage Monitoring Script
# Create a script that monitors disk usage on specific partitions (e.g., /, /var, /home).
# If usage exceeds 80%, send an email alert.

# Install mailutils 
sudo apt-get update
sudo apt-get install -y mailutils

partitions=("/" "/var" "/home")
threshold=80
alert_email="sparshjaipuriyar@gmail.com"

for partition in "${partitions[@]}"; do
    usage=$(df -h "$partition" | awk 'NR==2 {gsub("%","",$5); print $5}')
    if [ "$usage" -ge "$threshold" ]; then
        subject="Disk Usage Alert: $partition at ${usage}%"
        message="Warning: usage exceeds 80%"
        echo "$message" | mail -s "$subject" "$alert_email"
    fi
done
