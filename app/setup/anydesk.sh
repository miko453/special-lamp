#!/bin/bash
set -e

ARCH=$(dpkg --print-architecture)
ANYDESK_VER="6.3.2-1"
URL="https://download.anydesk.com/linux/anydesk_${ANYDESK_VER}_${ARCH}.deb"

echo "===== 安装 AnyDesk v${ANYDESK_VER} (${ARCH}) ====="

# 安装依赖
apt-get update
apt-get install -y --no-install-recommends wget gnupg ca-certificates libgtk2.0-0 libx11-6 libxcb1

# 下载并安装 .deb
wget -O /tmp/anydesk.deb "$URL"
dpkg -i /tmp/anydesk.deb || apt-get install -f -y
rm -f /tmp/anydesk.deb

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== AnyDesk 安装完成 ====="

