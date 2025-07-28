#!/bin/bash


# 1. Service Monitoring Script
# Write a script that checks if a list of services (e.g., nginx, mysql, redis) are running. 
# If any are stopped, log the service name and timestamp into a log file.


services=("nginx" "mysql" "redis")
log_file="/var/log/service_monitor.log"
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

touch "$log_file"

for service in "${services[@]}";
do
    if systemctl is-active "$service";
     then
        echo "$service is up and running"
    else
        echo "$timestamp - $service is not running" >> "$log_file"
    fi
done

