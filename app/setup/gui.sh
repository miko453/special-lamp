#!/bin/bash
set -e

echo "===== 更新 apt 源 ====="
apt-get update

echo "===== 安装 XFCE4 桌面和 VNC 及完整依赖 ====="
apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-session \
    xfce4-goodies \
    xfce4-terminal \
    xfce4-panel \
    xfce4-settings \
    xfce4-power-manager \
    xfce4-appfinder \
    dbus-x11 \
    x11-xserver-utils \
    xdg-utils \
    exo-utils \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf \
    fonts-noto-cjk \
    fonts-wqy-zenhei \
    fonts-noto-color-emoji \
    wget curl git nano htop tree procps locales \
    tigervnc-standalone-server \
    tigervnc-tools \
    mesa-utils \
    pulseaudio pulseaudio-utils

# Polkit 相关
# Kali 2025.4 已用 polkitd 替代 policykit-1
if apt-cache show polkitd >/dev/null 2>&1; then
    echo "安装 polkitd"
    apt-get install -y polkitd
fi

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "===== XFCE4 桌面和 VNC 安装完成 ====="
