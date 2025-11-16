#!/bin/bash
set -e

echo "===== 安装 XFCE4 桌面和 VNC 组件 ====="
apt-get update
apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-goodies \
    terminator \
    tigervnc-standalone-server \
    tigervnc-tools \
    dbus-x11 \
    x11-xserver-utils \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
    fonts-wqy-zenhei

echo "===== GUI 模块安装完成 ====="

