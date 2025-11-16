#!/bin/bash
set -e

# 设置非交互模式
export DEBIAN_FRONTEND=noninteractive

echo "===== 更新 Kali 软件源 ====="
apt-get update

echo "===== 安装基础工具 ====="
apt-get install -y --no-install-recommends \
    dialog \
    aptitude \
    dbus \
    dbus-user-session \
    openssh-client \
    openssh-server \
    curl \
    wget \
    unzip \
    htop \
    iputils-ping \
    net-tools \
    iproute2 \
    psmisc \
    sudo \
    vim \
    ca-certificates \
    dbus-x11 \
    zsh \
    zsh-common \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    locales

echo "===== 清理缓存 ====="
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "===== 创建普通用户 qwe ====="
useradd -m -d /config -s /bin/zsh qwe
usermod -aG sudo qwe
echo "qwe ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
chown -R qwe:qwe /config

echo "===== 设置密码 ====="
echo 'root:toor' | chpasswd
echo 'qwe:toor' | chpasswd
chsh -s /bin/zsh root

echo "===== 配置 SSH ====="
mkdir -p /run/sshd
if [ -f /app/noyes.conf ]; then
    cp /app/noyes.conf /etc/ssh/ssh_config.d/
fi

echo "===== 基础组件安装完成 ====="

