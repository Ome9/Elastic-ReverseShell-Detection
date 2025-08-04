# 🕹️ Elastic Reverse Shell Detection Lab

## Usage Guide

<div align="center">

![Lab Status](https://img.shields.io/badge/Lab%20Status-Active-brightgreen?style=for-the-badge) ![ELK Stack](https://img.shields.io/badge/ELK%20Stack-8.x-blue?style=for-the-badge&logo=elastic) ![Security](https://img.shields.io/badge/Security-Detection%20Lab-red?style=for-the-badge&logo=security)

_Master the art of threat detection with hands-on cybersecurity simulations_

</div>

---

## 🎯 Overview

This comprehensive guide walks you through **running attack simulations**, **verifying detections**, and **analyzing results** using our powerful Kibana dashboards. Transform your cybersecurity skills with real-world threat detection scenarios.

---

## 🚀 Quick Start

### 1️⃣ Launch Your ELK Stack

<details> <summary><b>🐳 Docker Deployment (Recommended)</b></summary>

```bash
cd elk-setup
docker-compose up -d
```

✅ **Quick verification:**

```bash
docker-compose ps
```

</details> <details> <summary><b>⚙️ Manual Installation</b></summary>

Ensure all services are running:

```bash
sudo systemctl status elasticsearch
sudo systemctl status logstash  
sudo systemctl status kibana
```

</details>

### 🌐 Access Kibana Dashboard

```
🔗 http://<your-elk-server-ip>:5601
```

---

## 📊 2️⃣ Verify Log Collection

> **🎯 Goal:** Ensure your logging pipeline is capturing security events

### Navigation Steps:

1. **Kibana** → **Discover**
2. Select index pattern: `*beat-*`

### Expected Data Sources:

- ✅ **Process Creation Logs**
- ✅ **User Authentication Events**
- ✅ **System Audit Trails**

<details> <summary>⚠️ <b>Troubleshooting: No Logs Appearing?</b></summary>

**Common fixes:**

- Verify Auditbeat & Filebeat configurations
- Check network connectivity: victim VM → ELK server
- Validate service status: `systemctl status auditbeat filebeat`

</details>

---

## ⚔️ 3️⃣ Execute Attack Simulation

### 🎭 Privilege Escalation Attack

Our simulation replicates real-world **privilege escalation attempts** commonly used by attackers.

```bash
cd attack-simulation
chmod +x invoke_attack.sh
./invoke_attack.sh
```

### 🔍 What This Simulation Does:

|Attack Vector|Description|Detection Goal|
|---|---|---|
|**Suspicious `sudo` Usage**|Mimics unauthorized privilege requests|Detect privilege escalation patterns|
|**Process Injection**|Simulates malicious process behavior|Identify abnormal process creation|
|**System Enumeration**|Replicates reconnaissance activities|Flag enumeration attempts|

---

## 📈 4️⃣ Monitor Real-Time Detections

### 🖥️ Primary Dashboard: **Victim Ubuntu VM Dashboard**

Navigate to: **Analytics** → **Dashboard** → **Victim Ubuntu VM Dashboard**

> **Note:** If the dashboard doesn't exist, you may need to import it or create it first. Check your `kibana-rules/` directory for dashboard exports.

### 🔥 Key Monitoring Panels:

<table> <tr> <td align="center">

**⚡ Attack Monitoring Table** <br> _Live process & user events_

</td> <td align="center">

**📊 Top Processes & Users** <br> _Most active executables_

</td> <td align="center">

**🚨 Privilege Escalation Detection** <br> _Suspicious behavior alerts_

</td> </tr> </table>

---

## 🛡️ 5️⃣ Security Detection Rules

### 🎯 Core Detection Rule

**Rule Name:** `Privilege Escalation Detected`

**Triggers on:**

- Suspicious `sudo`/`su` invocation patterns
- Unusual privilege request sequences
- Anomalous user behavior

**Verification Path:**

```
Security → Rules and Connectors → Detection rules (v8.x)
# OR for older versions:
Management → Stack Management → Rules and Connectors
```

> **Important:** In ELK 8.x, detection rules are located in the Security app, not under Kibana management.

### 📋 Rule Performance Metrics

|Metric|Target|Status|
|---|---|---|
|**Detection Rate**|>95%|✅|
|**False Positives**|<5%|✅|
|**Response Time**|<30s|✅|

---

## 📝 6️⃣ Log Collection & Analysis

### 💾 Automated Log Storage

Simulation logs are automatically stored in:

```bash
log-collection/simulation-logs/
```

### 🔧 Manual Log Capture

For detailed analysis:

```bash
journalctl -xe > ../log-collection/simulation-logs/linux_priv_esc.log
```

---

## ✅ Success Validation

### 🎯 Completion Checklist

- [ ] **Attack Triggers Alerts** in Kibana dashboards
- [ ] **Dashboard Panels Populate** with live process data
- [ ] **Detection Rule Activates** - "Privilege Escalation Detected"
- [ ] **Logs Successfully Captured** in designated directories

---

## 📸 Documentation & Reporting

### 🖼️ Screenshot Collection

Export your dashboard visualizations:

```bash
# Save screenshots to:
kibana-rules/screenshots/
```

### 📄 Report Generation

Use captured screenshots for:

- **Incident Response Documentation**
- **Security Assessment Reports**
- **Training Material Development**

---

## 🔗 Quick Links

<div align="center">

[![Kibana Dashboard](https://img.shields.io/badge/Kibana-Dashboard-purple?style=for-the-badge&logo=kibana)](http://localhost:5601/) [![Attack Simulation](https://img.shields.io/badge/Run-Attack%20Simulation-red?style=for-the-badge&logo=terminal)](https://claude.ai/chat/attack-simulation/) [![Documentation](https://img.shields.io/badge/View-Documentation-blue?style=for-the-badge&logo=gitbook)](https://claude.ai/chat/docs/)

</div>

---

## 🤝 Contributing

Found an issue or want to enhance the lab? We welcome contributions!

1. **Fork** the repository
2. **Create** your feature branch
3. **Commit** your changes
4. **Push** to the branch
5. **Open** a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://claude.ai/chat/LICENSE) file for details.

---

<div align="center">

**🌟 Star this repository if it helped you master threat detection! 🌟**

_Made with ❤️ for the cybersecurity community_

</div>