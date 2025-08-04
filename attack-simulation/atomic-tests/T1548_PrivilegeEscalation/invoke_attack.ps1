<#
.SYNOPSIS
Simulates a privilege escalation attempt on a Windows system for Elastic detection testing.

.DESCRIPTION
This script will:
1. Create a temporary admin account (simulation only)
2. Attempt to escalate privileges
3. Log activity to Windows Event Log for detection

.NOTE
This is a safe simulation for lab use only. 
Do NOT run on production systems.

#>

Write-Host "[*] Starting Windows Privilege Escalation Simulation..." -ForegroundColor Yellow

# Step 1: Create a temporary user (non-persistent for lab)
$UserName = "TempElevateUser"
$Password = ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force

Write-Host "[*] Creating temporary user: $UserName" -ForegroundColor Cyan
New-LocalUser -Name $UserName -Password $Password -FullName "Privilege Escalation Test User" -Description "Elastic Detection Simulation" 

# Step 2: Add user to Administrators group (simulating escalation)
Write-Host "[*] Adding $UserName to Administrators group..." -ForegroundColor Cyan
Add-LocalGroupMember -Group "Administrators" -Member $UserName

# Step 3: Log event to Event Log (for Winlogbeat)
Write-Host "[*] Logging Event ID 4720 and 4728 for detection..." -ForegroundColor Cyan
Write-EventLog -LogName Security -Source "Microsoft-Windows-Security-Auditing" -EventID 4720 -EntryType Information -Message "User Account Created for Simulation"
Write-EventLog -LogName Security -Source "Microsoft-Windows-Security-Auditing" -EventID 4728 -EntryType Information -Message "User Added to Admin Group for Simulation"

Write-Host "[+] Simulation Complete! Check Elastic for Privilege Escalation Detection." -ForegroundColor Green
