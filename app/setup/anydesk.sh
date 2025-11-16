#!/bin/bash
set -e

echo "===== 安装 AnyDesk ====="

# 更新软件源并安装依赖
apt-get update
apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates

# 导入 AnyDesk 公钥到 trusted keyring
wget -O- https://keys.anydesk.com/repos/DEB-GPG-KEY | gpg --dearmor > /usr/share/keyrings/anydesk.gpg

# 添加 AnyDesk 官方仓库，并指定使用该 key
echo "deb [signed-by=/usr/share/keyrings/anydesk.gpg] http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk.list

# 更新软件源并安装 AnyDesk
apt-get update
apt-get install -y --no-install-recommends anydesk

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== AnyDesk 安装完成 ====="

