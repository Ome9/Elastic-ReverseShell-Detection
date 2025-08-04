#!/bin/bash
# Elastic Detection Simulation: Linux Privilege Escalation (T1548)
# Safe for lab use only!

echo "[*] Starting Linux Privilege Escalation Simulation..."

# Step 1: Log a sudo attempt
echo "[*] Simulating 'sudo su' command execution..."
logger "Elastic Detection Simulation: sudo su executed by $(whoami)"

# Step 2: Create a temporary root-level action
echo "[*] Creating temporary privileged file..."
sudo touch /root/elastic_detection_test.txt
sudo chmod 600 /root/elastic_detection_test.txt

# Step 3: Clean up
echo "[*] Cleaning up temporary files..."
sudo rm -f /root/elastic_detection_test.txt

echo "[+] Simulation Complete! Check Auditbeat logs in Elastic."
