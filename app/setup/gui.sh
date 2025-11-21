#!/bin/bash
set -e

echo "===== 开始安装 XFCE4 GUI 环境 ====="

apt-get update

apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-session \
    xfce4-goodies \
    xfce4-terminal \
    policykit-1 \
    dbus-x11 \
    tigervnc-standalone-server \
    tigervnc-tools \
    x11-xserver-utils \
    xdg-utils \
    exo-utils \
    fonts-noto-cjk \
    fonts-wqy-zenhei \
    fonts-noto-color-emoji

echo "===== XFCE4 + VNC 所需组件安装完毕 ====="

# 防止 XFCE 报错：配套运行目录（不启动，只创建）
mkdir -p /tmp/xdg
chmod 700 /tmp/xdg

echo "===== 安装脚本执行完成（纯安装，无启动） ====="
