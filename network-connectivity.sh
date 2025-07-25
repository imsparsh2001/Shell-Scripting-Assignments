#!/bin/bash

# 6. Network Connectivity Check
# Write a script that pings a set of servers (e.g., google.com, github.com).
# Log the status of each server (reachable or not) into a file.


servers=("google.com" "github.com")
log_file="/var/log/network_connectivity.log"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

touch "$log_file"

for server in "${servers[@]}"; do
    if ping -c 1 -W 2 "$server"; then
        echo "$timestamp - $server is reachable" >> "$log_file"
    else
        echo "$timestamp - $server is NOT reachable" >> "$log_file"
    fi
done
