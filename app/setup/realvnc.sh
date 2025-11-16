#!/bin/bash
set -e

echo "===== 安装 RealVNC Viewer ====="

# 更新软件源并安装依赖
apt-get update
apt-get install -y --no-install-recommends \
    libgssapi-krb5-2 \
    libssl3 \
    wget \
    apt-transport-https \
    ca-certificates

# 下载并安装 RealVNC Viewer 官方 deb
VNC_DEB="VNC-Viewer-7.11.0-Linux-x64.deb"
wget -q "https://downloads.realvnc.com/download/file/viewer.files/${VNC_DEB}"
apt-get install -y --no-install-recommends ./${VNC_DEB}
rm -f ./${VNC_DEB}

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== RealVNC Viewer 安装完成 ====="

