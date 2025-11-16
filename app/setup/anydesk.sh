#!/bin/bash
set -e

echo "===== 安装 AnyDesk ====="

# 更新软件源并安装依赖
apt-get update
apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates

# 添加 AnyDesk 官方仓库并导入公钥
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk.list

# 更新软件源并安装 AnyDesk
apt-get update
apt-get install -y --no-install-recommends anydesk

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== AnyDesk 安装完成 ====="

