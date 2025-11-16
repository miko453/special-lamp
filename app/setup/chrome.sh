#!/bin/bash
set -e

echo "===== 安装最新版 Google Chrome ====="

# 更新软件源并安装依赖
apt-get update
apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates

# 下载并安装官方 Chrome
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== Google Chrome 安装完成 ====="

