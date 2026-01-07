# Installation of wine
## 1. Enable 32-bit Architecture

Run: 
```bash
sudo dpkg --add-architecture i386
```

## 2. Download and Add the Winehq key 

Create a directory for the key and download the official WineHQ repository key to ensure the software is authentic:

```bash
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
```

## 3. Add the WineHQ Repository

```bash
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
```

## 4. Update Packages and Install Wine

Update your local package list and install the Stable version (recommended for most users):

```bash
sudo apt update
sudo apt install --install-recommends winehq-stable
```

**Note**: You can also install `winehq-devel` if you need the absolute latest features, but it may be less stable.

## 5. Configure Wine

```bash
winecfg
```

Repair the gui:

```bash
sudo ln -s /usr/share/doc/wine/examples/wine.desktop /usr/share/applications/
```


