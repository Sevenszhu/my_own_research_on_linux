# Xubuntu 24.04 苹果化视觉与高颜值终端安装指南

这份指南旨在将 Xubuntu 24.04 (Xfce) 打造为具有 macOS 审美且适合底层开发的系统环境。

---

## 一、 桌面布局与视觉苹果化

### 1. 安装 WhiteSur 主题与图标
这是目前最逼真的 macOS 风格主题。

* **安装依赖工具：**
    ```bash
    sudo apt update
    sudo apt install git libglib2.0-dev-bin libxml2-utils ant sassc
    ```

* **下载并安装 GTK 主题：**
    ```bash
    git clone [https://github.com/vinceliuice/WhiteSur-gtk-theme.git](https://github.com/vinceliuice/WhiteSur-gtk-theme.git) --depth=1
    cd WhiteSur-gtk-theme
    ./install.sh -t all -s 280 -p 30 -i apple -b default
    ```

* **下载并安装图标包：**
    ```bash
    git clone [https://github.com/vinceliuice/WhiteSur-icon-theme.git](https://github.com/vinceliuice/WhiteSur-icon-theme.git) --depth=1
    cd WhiteSur-icon-theme
    ./install.sh -a
    ```

### 2. 界面设置
* **外观设置：** 打开 `设置 -> 外观`，在“样式”中选择 `WhiteSur-Light` 或 `Dark`，在“图标”中选择 `WhiteSur`。
* **窗口管理器：** 打开 `设置 -> 窗口管理器`，选择 `WhiteSur` 主题。将按钮布局拖动到**左侧**。
* **面板调整：**
    * 将顶栏面板移动到屏幕顶部，透明度调至 80%。
    * 安装 **Plank** 作为底栏：`sudo apt install plank`。

### 3. 字体美化
* **推荐字体：** SF Pro (界面), SF Mono (终端)。
* **渲染设置：** `设置 -> 外观 -> 字体`
    * 抗锯齿：开启
    * 提示 (Hinting)：Slight (轻度)
    * 次像素顺序：RGB

---

## 二、 终端环境高颜值化 (lsd + batcat)

### 1. 安装现代替代工具
```bash
# 安装 lsd (带图标的 ls) 和 bat (带高亮的 cat)
sudo apt update
sudo apt install lsd bat
```
### 2. 配置快捷别名 (Alias)
为了实现 `lsls` 和 `catbat` 等自定义命令，并解决 Ubuntu 中 `batcat` 的命名问题：

1. 编辑配置文件：`nano ~/.bashrc`

2. 在文件末尾添加以下内容：

```bash
# 使用 lsd 替代 ls (显示小画面图标)
alias ls='lsd'
alias lsls='lsd -l'
alias lt='lsd --tree'

# 使用 batcat 替代 cat (语法高亮)
alias cat='batcat --paging=never'
alias bat='batcat'
alias catbat='batcat'

# 命令容错
alias cdk='cd'
alias CD='cd'
```

3. 使其生效：`source ~/.bashrc`
