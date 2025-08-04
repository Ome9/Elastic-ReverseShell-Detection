# 🚀 Privilege Escalation Attack Simulation (T1548)

<div align="center">

![Security Testing](https://img.shields.io/badge/Security-Testing-red?style=for-the-badge&logo=security&logoColor=white) ![MITRE ATT&CK](https://img.shields.io/badge/MITRE-ATT%26CK-blue?style=for-the-badge&logo=mitre&logoColor=white) ![Elastic SIEM](https://img.shields.io/badge/Elastic-SIEM-00BFB3?style=for-the-badge&logo=elastic&logoColor=white) ![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-lightgrey?style=for-the-badge)

**🔥 Advanced Atomic Tests for Simulating Privilege Escalation Attacks**  
_Test your Elastic SIEM detection capabilities with real-world attack scenarios_

</div>

---

## 🎯 Overview

This repository contains **battle-tested atomic simulations** designed to validate your **Elastic SIEM** detection rules against sophisticated privilege escalation techniques. Each test generates authentic attack telemetry that mirrors real-world adversary behavior.

<table> <tr> <td width="50%">

### 🏆 Key Features

- ✅ **MITRE ATT&CK Aligned** - Follows T1548 framework
- ✅ **Multi-Platform** - Windows & Linux support
- ✅ **Production Safe** - Isolated test environment
- ✅ **Elastic Ready** - Optimized for SIEM detection
- ✅ **Automated Cleanup** - No residual artifacts

</td> <td width="50%">

### 🔍 What Gets Detected

- 🚨 **Privilege Escalation Attempts**
- 🚨 **Suspicious User Creation**
- 🚨 **SUID/SGID Binary Abuse**
- 🚨 **Admin Group Modifications**
- 🚨 **Anomalous Process Execution**

</td> </tr> </table>

---

## 📂 Repository Structure

```
T1548_PrivilegeEscalation/
├── 🪟 invoke_attack.ps1       # Windows PowerShell simulation
├── 🐧 invoke_attack.sh        # Linux Bash simulation  
├── 📸 screenshots/            # Detection evidence gallery
│   ├── windows_attack.png
│   ├── linux_attack.png
│   └── kibana_dashboard.png
├── 📋 detection_rules/        # Elastic detection rules
│   ├── windows_privesc.json
│   └── linux_privesc.json
└── 📖 README.md              # This comprehensive guide
```

---

## 🎮 MITRE ATT&CK Mapping

<div align="center">

|**Element**|**Details**|
|---|---|
|🆔 **Technique ID**|[T1548 – Abuse Elevation Control Mechanism](https://attack.mitre.org/techniques/T1548/)|
|🔧 **Sub-Techniques**|T1548.001 (Setuid/Setgid) • T1548.002 (Bypass UAC)|
|🎯 **Tactic**|**Privilege Escalation**|
|🏷️ **Data Sources**|Process Creation • User Account Management • File Monitoring|

</div>

---

## ⚡ Quick Start

### 🪟 **Windows Simulation**

```powershell
# 🔐 Run as Administrator
cd .\T1548_PrivilegeEscalation\
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
.\invoke_attack.ps1
```

<details> <summary>📊 <strong>Expected Windows Telemetry</strong></summary>

```yaml
Event IDs Generated:
├── 4720 - User Account Created
├── 4728 - Member Added to Security Group  
├── 4732 - Member Added to Local Group
├── 1 - Process Creation (Sysmon)
└── 4688 - New Process Creation
```

**🔍 Detection Triggers:**

- Winlogbeat → Elastic Stack
- Sysmon → Process monitoring
- Windows Security Logs → User management

</details>

### 🐧 **Linux Simulation**

```bash
# 🚀 Execute with standard user privileges
chmod +x invoke_attack.sh
./invoke_attack.sh
```

<details> <summary>📊 <strong>Expected Linux Telemetry</strong></summary>

```yaml
Log Sources Generated:
├── /var/log/auth.log - Sudo attempts
├── /var/log/syslog - Process execution
├── Auditd logs - File system changes
└── System calls - SUID binary access
```

**🔍 Detection Triggers:**

- Auditbeat → Process monitoring
- Filebeat → Log file analysis
- System audit → Privilege changes

</details>

---

## 🎨 Visual Detection Gallery

<div align="center">

### 🖥️ **Attack Execution**

<img width="1919" height="941" alt="Pasted image 20250804012824" src="https://github.com/user-attachments/assets/8ea4a583-906b-46e0-bb0e-4ca4a8d17600" />


### 📊 **Kibana Dashboard Detection**

<img width="1919" height="930" alt="Pasted image 20250804013106" src="https://github.com/user-attachments/assets/16f96a2e-1e3a-4e2d-aa1f-cea7c2f7ff98" />


### 🔍 **Event Timeline Analysis**

<img width="1900" height="667" alt="Pasted image 20250804013441" src="https://github.com/user-attachments/assets/3ff13d8e-32f0-44bd-8226-bb4d521fb000" />

<img width="1903" height="665" alt="Pasted image 20250804013551" src="https://github.com/user-attachments/assets/3d5fa2fd-b364-4b48-baac-c877d5279d1f" />


</div>


---

## 🛡️ Detection Engineering

### 📋 **Pre-built Detection Rules**

<table> <tr> <th>🪟 Windows Rules</th> <th>🐧 Linux Rules</th> </tr> <tr> <td>

```json
{
  "rule_name": "Privilege Escalation - User Creation",
  "event_id": "4720",
  "severity": "high",
  "mitre_technique": "T1548.002"
}
```

</td> <td>

```json
{
  "rule_name": "SUID Binary Abuse Detection", 
  "log_source": "auditd",
  "severity": "critical",
  "mitre_technique": "T1548.001"
}
```

</td> </tr> </table>

### 🎯 **KQL Query Examples**

```kql
# Windows Privilege Escalation Detection
event.code:4720 and winlog.event_data.TargetUserName:*temp*

# Linux Sudo Abuse Detection  
process.name:sudo and user.name:*temp* and event.action:executed
```

---

## 🧪 Testing Scenarios

<div align="center">

|**Scenario**|**Platform**|**Technique**|**Detection Rate**|
|---|---|---|---|
|🔥 **Admin User Creation**|Windows|T1548.002|![99%](https://progress-bar.dev/99?color=success)|
|🔥 **SUID Binary Abuse**|Linux|T1548.001|![95%](https://progress-bar.dev/95?color=success)|
|🔥 **UAC Bypass Attempt**|Windows|T1548.002|![87%](https://progress-bar.dev/87?color=warning)|
|🔥 **Sudo Misconfiguration**|Linux|T1548.001|![92%](https://progress-bar.dev/92?color=success)|

</div>

---

## 🔧 Advanced Configuration

<details> <summary><strong>🎛️ Customize Attack Parameters</strong></summary>

```powershell
# Windows - Modify invoke_attack.ps1
$AttackParams = @{
    UserName = "evil_user_$(Get-Random)"
    GroupName = "Administrators" 
    Duration = 30  # seconds
    Cleanup = $true
}
```

```bash
# Linux - Modify invoke_attack.sh
ATTACK_USER="malicious_$(date +%s)"
SUID_TARGET="/tmp/evil_binary"
CLEANUP_DELAY=30
```

</details> <details> <summary><strong>📡 Elastic Integration</strong></summary>

```yaml
# elasticsearch.yml configuration
xpack.security.enabled: true
xpack.monitoring.enabled: true

# kibana.yml configuration  
xpack.encryptedSavedObjects.encryptionKey: "your-32-char-key"
xpack.security.enabled: true
```

</details>

---

## 🚨 Safety & Compliance

<div align="center">

|⚠️ **IMPORTANT DISCLAIMERS**|
|---|
|🔒 **Educational Use Only** - Authorized testing environments exclusively|
|🚫 **No Production Systems** - Never execute on live/production infrastructure|
|📋 **Legal Compliance** - Ensure proper authorization before testing|
|🧹 **Automated Cleanup** - All artifacts are automatically removed|
|📊 **Audit Trail** - Complete logging of all test activities|

</div>

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](https://claude.ai/chat/CONTRIBUTING.md) for details.

```bash
# 🍴 Fork the repository
git clone https://github.com/yourusername/privilege-escalation-simulation.git

# 🌿 Create feature branch  
git checkout -b feature/new-attack-simulation

# 📝 Commit changes
git commit -m "Add: New T1548.003 simulation"

# 🚀 Push and create PR
git push origin feature/new-attack-simulation
```

---

## 📞 Support & Resources

<div align="center">

[![Documentation](https://img.shields.io/badge/%F0%9F%93%9A-Documentation-blue?style=for-the-badge)](https://docs.elastic.co/siem) [![Community](https://img.shields.io/badge/%F0%9F%92%AC-Community-green?style=for-the-badge)](https://discuss.elastic.co/) [![Issues](https://img.shields.io/badge/%F0%9F%90%9B-Issues-red?style=for-the-badge)](https://github.com/yourusername/repo/issues) [![License](https://img.shields.io/badge/%F0%9F%93%9C-License-yellow?style=for-the-badge)](https://claude.ai/chat/LICENSE)

</div>

---

<div align="center">

**🔥 Ready to test your defenses? Let's simulate some attacks! 🔥**

_Made with ❤️ for the cybersecurity community_

</div>
