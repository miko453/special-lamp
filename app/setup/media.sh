#!/bin/bash
set -e

echo "===== 安装多媒体软件：OBS Studio, VLC, FFmpeg ====="

# 更新软件源
apt-get update

# 安装多媒体工具和依赖
apt-get install -y --no-install-recommends \
    obs-studio \
    vlc \
    ffmpeg \
    alsa-utils \
    pulseaudio \
    pulseaudio-utils \
    dbus-x11 \
    x11-xserver-utils \
    fonts-noto-color-emoji

# 清理缓存
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

echo "===== 多媒体模块安装完成 ====="

