#!/bin/bash

# 5. Service Restart on Failure
# Create a script to check if a service (e.g., nginx) is running.
# If not, restart the service and log the action.

service="nginx"
log_file="/var/log/service-restart.log"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

if systemctl is-active "$service"; then
    echo "$service is running."
else
    echo "$timestamp: $service was not running. Restarting..." >> "$log_file"
    systemctl restart "$service"

    if systemctl is-active "$service"; then 
        echo "$timestamp: $service restarted successfully." >> "$log_file"
    else
        echo "$timestamp: $service failed to restart!" >> "$log_file"
    fi
fi
