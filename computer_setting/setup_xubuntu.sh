#!/bin/bash

# Xubuntu 系统一键优化脚本
# 适用系统：Xubuntu / Linux Mint XFCE / Zorin OS Lite

echo "开始执行系统优化..."

# [cite_start]1. 基础环境与解码器 [cite: 1, 2]
echo "正在安装基础库与解码器..."
sudo apt update
sudo apt install -y ubuntu-restricted-extras build-essential gdb nala \
cmake qtcreator autoconf vpnc git curl wget gpg p7zip-full p7zip-rar axel

# [cite_start]2. Fcitx 5 输入法配置 [cite: 3]
echo "正在配置 Fcitx 5 输入法..."
sudo apt install -y fcitx5 fcitx5-chinese-addons fonts-noto-color-emoji kde-config-fcitx5

# [cite_start]3. 系统清理 (移除 LibreOffice 及多余软件) [cite: 9]
echo "正在移除冗余软件..."
sudo apt-get remove --purge -y libreoffice*
sudo apt-get remove -y thunderbird totem rhythmbox empathy brasero simple-scan \
gnome-mahjongg onboard deja-dup gnome-mines cheese transmission-common gnome-sudoku

# [cite_start]4. 硬件与启动优化 [cite: 6, 7]
echo "正在进行硬件与引导优化..."
sudo apt install -y tlp tlp-rdw grub-customizer boot-repair
sudo tlp start
sudo ufw enable
sudo ufw allow 22/tcp

# [cite_start]5. 最后维护清理 [cite: 8]
echo "正在进行最后清理..."
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean
sudo rm -rf ~/.local/share/Trash/*

echo "优化完成！建议重启系统以使所有更改生效。"
