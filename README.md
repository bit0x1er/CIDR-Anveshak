<div align="center">

# ⚡ CIDR-Anveshak
### Automated CIDR Blocks Finder

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white)
![OSINT](https://img.shields.io/badge/Category-Network%20Recon-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-success?style=flat-square)

</div>

---


<div align="center">
  <img width="750" alt="logo" src="https://github.com/user-attachments/assets/5aafc7e0-0b41-4ab7-ba10-c7d259f60e26" />
</div>


---

<br>

## 🔍 Overview

**CIDR-Anveshak** is a simple, fast, high-performance, lightweight bash utility designed for security researchers. It automates the extraction of Autonomous System Numbers (ASNs) and their corresponding IPv4 and IPv6 CIDR address blocks directly from BGP routing intelligence.

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

## 🎯 Purpose

The primary purpose of **CIDR-Anveshak** is to eliminate the tedious and time-consuming process of manually searching, copying, and pasting CIDR blocks into texts files - from `https://bgp.he.net` during network reconnaissance. 

Instead of manually gathering CIDR blocks for bug bounty hunting or network pentesting, this tool automates the entire discovery process in seconds. It extracts all associated IPv4 and IPv6 CIDR blocks for your target organization and automatically saves them into dedicated, clean text files on your local system. 

By automating this workflow, it saves valuable time and effort, allowing you to bypass manual data collection and focus directly on execution—whether that involves feeding the target CIDR lists into tools like `nmap` or proceeding straight into active network security testing.

<br>

---

<br>

## 🌐 Source
This tool fetches company CIDR blocks directly from the `bgp.he.net` website.
```bash
https://bgp.he.net
```

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

## 🎬 Demo

<img width="600" height="714" alt="output" src="https://github.com/user-attachments/assets/2e297ee8-085d-4b62-9e1b-7a50d6087825" />

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
This tool is created strictly for authorized security auditing, reconnaissance, and educational purposes. The author is not responsible for any misuse.

<br>

---

<br>

## 🤝 Contributing

Contributors are always welcome! If you have any ideas to improve **CIDR-Anveshak**, feel free to contribute.

**Here is how you can do it:**

1. Fork the project
2. Create your feature branch
3. Commit your changes 
4. Push to the branch 
5. Open a Pull Request

<br>

---







   
