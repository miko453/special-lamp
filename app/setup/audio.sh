#!/bin/bash
set -e

echo "===== 安装 Pulseaudio 和 ALSA 工具 ====="
apt-get update
apt-get install -y --no-install-recommends \
    pulseaudio \
    pulseaudio-utils \
    alsa-utils \
    pavucontrol \
    dbus-x11

echo "===== 配置虚拟音频设备 ====="

# 创建 Pulseaudio 配置目录
mkdir -p /etc/pulse
cat > /etc/pulse/default.pa <<'EOF'
# Load the null sink (virtual output)
load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
# Enable default Pulseaudio modules
load-module module-native-protocol-unix
load-module module-cli-protocol-unix
load-module module-rescue-streams
load-module module-always-sink
load-module module-suspend-on-idle
load-module module-console-kit
load-module module-systemd-login
load-module module-stream-restore
load-module module-device-restore
load-module module-augment-properties
load-module module-role-cork
EOF

# 确保 pulseaudio 以非 root 用户启动
echo "===== 音频模块安装完成 ====="
echo "启动时可以通过 'pulseaudio --system=false --daemonize' 启动虚拟音频服务"

