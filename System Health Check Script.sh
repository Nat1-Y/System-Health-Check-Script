#!/bin/bash

# Variables
ADMIN_EMAIL="natiyohannes.2017@gmail.com"
REPORT="/tmp/system_health_report.txt"
HOSTNAME=$(hostname)

# Date and Time
echo "System Health Report for $HOSTNAME" > $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "=====================================" >> $REPORT

# Disk Usage
echo "" >> $REPORT
echo "Disk Usage:" >> $REPORT
df -h >> $REPORT

# Memory Usage
echo "" >> $REPORT
echo "Memory Usage:" >> $REPORT
free -h >> $REPORT

# Running Processes
echo "" >> $REPORT
echo "Running Processes:" >> $REPORT
ps aux --sort=-%mem | head -n 10 >> $REPORT

# Network Connections
echo "" >> $REPORT
echo "Network Connections:" >> $REPORT
ss -tuln >> $REPORT

# Email the Report
mail -s "Daily System Health Report for $HOSTNAME" $ADMIN_EMAIL < $REPORT

# Display the Report
cat $REPORT


# Clean up
rm $REPORT
