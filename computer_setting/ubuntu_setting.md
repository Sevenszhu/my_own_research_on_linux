# Ubuntu System Installation & Optimization
> This guide is adapted for Ubuntu (20.04/22.04/24.04), Linux Mint (21/22), and Linux Xubuntu (22.04)

## 1. Install Media Codecs & Microsoft Extra Fonts

```bash
sudo apt install ubuntu-restricted-extras -y
```
**Note**: If prompted to "accept the agreement", select "OK" with the Tab key and press Enter to confirm.

## 2. Install Linux Basic Development Libraries & Tools

### 2.1 Core Compilation Tools

```bash
# Includes core compilation tools like gcc, g++, make
sudo apt install build-essential -y  
# gdb debugger, nala (apt enhancement tool), gdebi (deb package installer)
sudo apt install gdb nala gdebi -y
```

### 2.2 Project Build Tools

```bash
sudo apt install cmake qtcreator -y
```

### 2.3 System Auxiliary Tools

```bash
# Evince is a universal PDF reader (preinstalled on most distributions; no need to reinstall)
sudo apt install vpnc git curl wget gpg p7zip-full p7zip-rar evince -y
```

### 2.4 Cloud Storage Tools

- Dropbox

```bash
sudo apt install nautilus-dropbox -y
```

- MEGAsync (Adapted for New Systems)

```bash 
# Replace with the package link for your system (example: Ubuntu 24.04)
wget https://mega.nz/linux/MEGAsync/xUbuntu_24.04/amd64/megasync-xUbuntu_24.04_amd64.deb
sudo dpkg -i megasync-xUbuntu_24.04_amd64.deb
sudo apt-get -f install 
```

### 2.5 Network Analysis Tools

```bash
sudo apt install wireshark -y
# Add the current user to the wireshark group to avoid using sudo every time:
sudo usermod -aG wireshark $USER
# Apply group permissions
newgrp wireshark  
```

