# 🔍 ELK Stack Setup Guide

> **Complete guide for setting up Elasticsearch, Logstash, and Kibana (ELK) stack with both Docker and manual installation options.**

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/) [![Elasticsearch](https://img.shields.io/badge/Elasticsearch-005571?style=for-the-badge&logo=elasticsearch&logoColor=white)](https://www.elastic.co/) [![Kibana](https://img.shields.io/badge/Kibana-005571?style=for-the-badge&logo=kibana&logoColor=white)](https://www.elastic.co/kibana/)

---

## 📑 Table of Contents

- [🐳 Option 1: Docker Setup (Quick Start)](https://claude.ai/chat/b7fe4c4c-7853-46d9-93d5-d2215b5f2502#-option-1-docker-setup-quick-start)
- [⚙️ Option 2: Manual Installation](https://claude.ai/chat/b7fe4c4c-7853-46d9-93d5-d2215b5f2502#%EF%B8%8F-option-2-manual-installation)
- [🚀 Getting Started](https://claude.ai/chat/b7fe4c4c-7853-46d9-93d5-d2215b5f2502#-getting-started)
- [🔧 Configuration](https://claude.ai/chat/b7fe4c4c-7853-46d9-93d5-d2215b5f2502#-configuration)
- [📊 Usage](https://claude.ai/chat/b7fe4c4c-7853-46d9-93d5-d2215b5f2502#-usage)

---

## 🐳 Option 1: Docker Setup (Quick Start)

> **💡 Perfect for rapid deployment** - Get a fully functional ELK stack running in minutes with minimal configuration.

### 📋 Prerequisites

**System Requirements:**

- Docker and Docker Compose installed
- At least **4 GB RAM** available
- Ports 9200 and 5601 accessible

```bash
# Install Docker and Docker Compose
sudo apt install docker.io docker-compose -y 
sudo systemctl enable docker --now
```

### 📁 Project Setup

```bash
# Clone the project
git clone https://github.com/Ome9/Elastic-ReverseShell-Detection.git 
cd Elastic-ReverseShell-Detection/elk-setup
```

**Required files in project directory:**

- `docker-compose.yml`
- `elasticsearch.yml`
- `kibana.yml`

### 🚀 Launch ELK Stack

```bash
# Start containers in detached mode
docker-compose up -d

# Verify running containers
docker ps
```

**Expected services:**

- ✅ `elasticsearch`
- ✅ `kibana`

### 🌐 Access Kibana Dashboard

**Connection Details:**

- **URL:** `http://<your-docker-host-ip>:5601`
- **Username:** `elastic`
- **Password:** Check container logs

```bash
# Retrieve generated password
docker logs <elasticsearch-container-name> 2>&1 | grep "generated password"
```

### 🔄 Container Management

```bash
# Stop the stack
docker-compose down

# Restart the stack
docker-compose up -d
```

---

## ⚙️ Option 2: Manual Installation

> **🔧 For custom configurations** - Complete control over your ELK stack installation and configuration.

### 📋 Prerequisites

**Requirements:**

- Linux machine (WSL or VM) with sudo privileges
- Windows machine for Winlogbeat (optional)
- Open ports: **9200** (Elasticsearch), **5601** (Kibana)

---

## 🔧 Step-by-Step Installation

### 1️⃣ Install Elasticsearch

#### Repository Setup

```bash
# Import Elastic GPG key
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# Add Elastic repository
sudo apt-add-repository "deb https://artifacts.elastic.co/packages/8.x/apt stable main"

# Update package list
sudo apt update
```

#### Installation & Service

```bash
# Install Elasticsearch
sudo apt install elasticsearch -y

# Enable and start service
sudo systemctl enable elasticsearch --now

# Check service status
sudo systemctl status elasticsearch
```

#### Verification

```bash
# Basic health check
curl -k -u elastic https://localhost:9200

# Detailed health check with JSON formatting
curl -u <username>:<password> https://localhost:9200 -k | jq
```

### 2️⃣ Install Kibana

```bash
# Install Kibana
sudo apt install kibana -y

# Enable and start service
sudo systemctl enable kibana --now

# Check service status
sudo systemctl status kibana
```

**Access Kibana Dashboard:** `http://<your-host-ip>:5601`

### 3️⃣ Configure Kibana

#### Edit Configuration File

```bash
sudo nano /etc/kibana/kibana.yml
```

#### 🌐 Network Configuration

> **Allow remote access** - Enable connections from other machines on your network.

```yaml
# Allow remote access (default: localhost only)
server.host: "0.0.0.0"
```

#### 🔗 Elasticsearch Integration

```yaml
# Elasticsearch connection
elasticsearch.hosts: ["https://localhost:9200"]

# Authentication credentials
elasticsearch.username: "kibana_system"
elasticsearch.password: "<your-password-here>"
```

#### 🔒 SSL Configuration

> **⚠️ Development environments only** - Disable strict SSL verification for self-signed certificates.

```yaml
# Disable SSL verification for self-signed certs
elasticsearch.ssl.verificationMode: none
```

#### 📝 Logging Setup

> **Troubleshooting enabled** - Enable file logging for better debugging capabilities.

```yaml
logging:
  appenders:
    file:
      type: file
      fileName: /var/log/kibana/kibana.log
      layout:
        type: json
  root:
    appenders:
      - default
      - file
```

#### 🔐 Security Encryption Keys

**Generate three unique 32-character keys:**

```bash
# Generate keys (run 3 times)
openssl rand -hex 16
```

**Add to kibana.yml:**

```yaml
xpack.encryptedSavedObjects.encryptionKey: "<key_1>"
xpack.reporting.encryptionKey: "<key_2>"
xpack.security.encryptionKey: "<key_3>"
```

#### 📁 PID File Configuration

```yaml
# PID file location
pid.file: /run/kibana/kibana.pid
```

**Create PID directory with proper permissions:**

```bash
# Create PID directory
sudo mkdir -p /run/kibana
sudo chown kibana:kibana /run/kibana
```

### 🔄 Apply Configuration

```bash
# Restart Kibana service
sudo systemctl restart kibana 

# Verify service status
sudo systemctl status kibana
```

---

## 🎯 Quick Access

|Service|URL|Default Port|
|---|---|---|
|**Kibana Dashboard**|`http://<your-server-ip>:5601`|5601|
|**Elasticsearch API**|`https://<your-server-ip>:9200`|9200|

---

## 📊 Usage

Once your ELK stack is running:

1. **Access Kibana** at `http://<your-server-ip>:5601`
2. **Login** with your elastic credentials
3. **Create index patterns** for your data
4. **Build visualizations** and dashboards
5. **Monitor** your logs and metrics

---

## 🛠️ Troubleshooting

<details> <summary><strong>Common Issues</strong></summary>

### Service won't start

```bash
# Check service logs
sudo journalctl -u elasticsearch -f
sudo journalctl -u kibana -f
```

### Memory issues

```bash
# Check available memory
free -h

# Adjust JVM heap size in /etc/elasticsearch/jvm.options
-Xms2g
-Xmx2g
```

### Port conflicts

```bash
# Check if ports are in use
sudo netstat -tlnp | grep :9200
sudo netstat -tlnp | grep :5601
```

</details>

---

## 📚 Additional Resources

- [Official Elasticsearch Documentation](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)
- [Kibana User Guide](https://www.elastic.co/guide/en/kibana/current/index.html)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](https://claude.ai/chat/LICENSE) file for details.

---

## ⭐ Show Your Support

Give a ⭐️ if this project helped you!

---

<div align="center">

**Built with ❤️ for the DevOps Community**

[![GitHub stars](https://img.shields.io/github/stars/Ome9/Elastic-ReverseShell-Detection?style=social)](https://github.com/Ome9/Elastic-ReverseShell-Detection) [![GitHub forks](https://img.shields.io/github/forks/Ome9/Elastic-ReverseShell-Detection?style=social)](https://github.com/Ome9/Elastic-ReverseShell-Detection)

</div>