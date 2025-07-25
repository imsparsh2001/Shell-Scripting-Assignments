#!/bin/bash

# 5. Service Restart on Failure
# Create a script to check if a service (e.g., nginx) is running.
# If not, restart the service and log the action.

service="nginx"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

if systemctl is-active --quiet "$service"; then
    echo "$service is running."
else
    echo "$timestamp: $service was not running. Restarting..." 
    systemctl restart "$service"

    if systemctl is-active --quiet "$service"; then
        echo "$timestamp: $service restarted successfully." 
    else
        echo "$timestamp: $service failed to restart!" 
    fi
fi
