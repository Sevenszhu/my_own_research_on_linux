#!/bin/bash

# --- 1. 更新系统并安装基础依赖 ---
echo "正在安装基础工具和主题依赖..."
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update
sudo apt install -y git libglib2.0-dev-bin libxml2-utils ant ulauncher lsd bat plank nnn

# --- 2. 配置终端别名 (lsd, batcat, catbat) ---
echo "正在配置 .bashrc 别名..."
cat << 'EOF' >> ~/.bashrc

# --- 苹果化终端别名配置 ---
# 使用 lsd 替代 ls (显示小画面图标)
alias ls='lsd'
alias lsls='lsd -l'
alias lt='lsd --tree'

# 使用 batcat 替代 cat (语法高亮)
alias cat='batcat --paging=never'
alias bat='batcat'
alias catbat='batcat'

# 命令纠错
alias cdk='cd'
alias CD='cd'
EOF

# --- 3. 修复 Ubuntu 下 batcat 的软链接问题 ---
# 这样你直接打 bat 也能生效
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat 2>/dev/null

# --- 4. 修复状态栏图标大小 (CSS 注入) ---
echo "正在优化状态栏图标大小..."
mkdir -p ~/.config/gtk-3.0
cat << 'EOF' >> ~/.config/gtk-3.0/gtk.css
/* 强制缩放指示器图标 */
#indicator-button image {
    -gtk-icon-transform: scale(1.2);
}
EOF

# --- 5. 提示主题下载步骤 ---
echo "------------------------------------------------"
echo "✅ 基础工具与别名配置完成！"
echo "👉 请运行 'source ~/.bashrc' 使别名生效。"
echo "👉 接下来建议手动运行以下命令安装 WhiteSur 主题："
echo "   git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1"
echo "   cd WhiteSur-gtk-theme && ./install.sh"
echo "------------------------------------------------"
