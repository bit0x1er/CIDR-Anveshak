<div align="center">

# ⚡ CIDR-Anveshak
### Automated CIDR Blocks Finder

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![OSINT](https://img.shields.io/badge/Category-Network%20Recon-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-success?style=flat-square)

</div>

---

<br>

## 🔍 Overview

**CIDR-Anveshak** is a simple, high-performance, lightweight bash utility designed for security researchers. It automates the extraction of Autonomous System Numbers (ASNs) and their corresponding IPv4 and IPv6 CIDR address blocks directly from BGP routing intelligence.

<br>

---

<br>

## ✨ Features

* **Instant ASN Discovery:** Automatically resolves organization or company names to all associated ASNs.
* **Dual-Stack Extraction:** Pulls both IPv4 and IPv6 prefixes/CIDR associated with the target infrastructure.
* **Automated Data Sorting:** Cleanly sorts, de-duplicates, and formats CIDR blocks for downstream tools.
* **Structured Output:** Automatically generates isolated text files for IPv4 and IPv6 CIDR blocks results.

<br>

---

<br>

## 🛠️ Prerequisites

Ensure the following utilities are installed on your system before running the script:

**Step 1: Update package lists:**
```bash
sudo apt update
```

**Step 2: Install curl (Data transfer tool):**
```bash
sudo apt install -y curl
```

**Step 3: Install figlet (ASCII banner generator):**
```bash
sudo apt install -y figlet
```

**Step 4: Install Core Utilities (grep, sed, sort):**

These core utilities come pre-installed on almost all Linux distributions. If they are missing, install them using -
```bash
sudo apt install -y coreutils grep sed
```

<br>

---

<br>

## 🚀 Installation & Usage

**Step 1: Clone the repository:**
```bash
git clone https://github.com/bit0x1er/CIDR-Anveshak.git
```

**Step 2: Grant execution permissions to the script:**
```bash
chmod +x cidr-anveshak.sh
```

**Step 3: Run the tool:**
```bash
./cidr-anveshak.sh
```

<br>

---

<br>

## ⚙️ Output
The tool outputs structured results into the local directory based on the target name:

`CIDR-Anveshak_[Target]_ipv4cidr.txt` — Cleaned list of unique IPv4 prefixes.

`CIDR-Anveshak_[Target]_ipv6cidr.txt` — Cleaned list of unique IPv6 prefixes.

<br>

---

<br>

## ⚠️ Disclaimer
This tool is created strictly for authorized security auditing, reconnaissance, and educational purposes. The author is not responsible for any misuse or unauthorized network scanning.

<br>

---







   
