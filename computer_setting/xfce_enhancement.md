# Xubuntu (XFCE) 系统安装与功能增强指南

## 一、 核心基础库与开发环境
安装基础开发工具和多媒体支持，确保系统可以正常编译代码和播放视频。

* **媒体解码器与微软字体**：安装常用的音频、视频解码器以及微软版权字体（如 Arial, Times New Roman）。 
    `sudo apt install ubuntu-restricted-extras -y`
* **基础库安装**：安装 `build-essential`（含 gcc/make）、`gdb` 调试器以及现代化包管理器 `nala`。 
    `sudo apt install build-essential gdb nala -y`
* **开发辅助工具**：安装 `cmake`、`qtcreator`、`autoconf` 以及基本系统工具 `git`、`curl`、`wget`。 
    `sudo apt install cmake qtcreator autoconf vpnc git curl wget gpg -y`
* **压缩与辅助工具**：安装 `p7zip` 完整版以处理各类压缩文件。 
    `sudo apt install p7zip-full p7zip-rar -y`

## 二、 输入法环境配置 (Fcitx 5)
在 Xubuntu 下建议使用更现代、响应更快的 **Fcitx 5**。 [cite: 3]

* **安装 Fcitx 5 核心及其组件**：安装主程序及中文输入插件。 [cite: 3]
    `sudo apt install fcitx5 fcitx5-chinese-addons -y`
* **安装彩色 Emoji 字体**：支持系统显示彩色表情。 [cite: 3]
    `sudo apt install fonts-noto-color-emoji -y`
* **XFCE/KDE 适配设置**：安装对应的配置界面工具。 [cite: 3]
    `sudo apt install kde-config-fcitx5 -y`

## 三、 系统清理与瘦身
移除 Xubuntu 预装但可能不需要的软件，释放系统资源。

* **彻底移除 LibreOffice**：使用 `--purge` 参数清除所有相关配置。 
    `sudo apt-get remove --purge libreoffice* -y`
* **删除其他冗余软件**：移除雷鸟邮件、扫雷游戏、屏幕阅读器等。 
    `sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg onboard deja-dup -y`
* **日常维护组合命令**： 
    - `sudo apt update && sudo apt upgrade -y`（更新系统包）
    - `sudo apt autoremove -y`（移除不再需要的孤立依赖）
    - `sudo apt clean`（清理安装包缓存记录）
    - `sudo rm -rf ~/.local/share/Trash/*`（清空回收站） 

## 四、 硬件管理与系统优化
* **电池管理 (TLP)**：笔记本用户必装，显著提升电池续航。 
    `sudo apt install tlp tlp-rdw -y && sudo tlp start`
* **硬盘挂载修复**：修复由于 Windows 快速启动导致的 NTFS 硬盘无法挂载问题。 
    `sudo ntfsfix /dev/sdXn`（请根据实际情况替换 `sdXn`）
* **多线程下载 (Axel)**：安装比 `wget` 速度更快的下载工具。 
    `sudo apt install axel -y`
* **防火墙规则配置**：启用 UFW 并配置基础权限。 
    `sudo ufw enable && sudo ufw allow 22/tcp`
* **启动修复工具**：安装 `grub-customizer` 和 `boot-repair` 以应对系统引导故障。 
    `sudo apt install grub-customizer boot-repair -y`

## 五、 系统故障修复建议
如果在 XFCE 桌面环境下发现设置中心无法正常打开，可以尝试重装管理组件： 
`sudo apt-get remove gnome-control-center && sudo apt-get install gnome-control-center`


## 脚本用法

对于setup_xubuntu.sh，然后在终端执行 chmod +x setup_xubuntu.sh && ./setup_xubuntu.sh。
