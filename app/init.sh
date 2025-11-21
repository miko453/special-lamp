#!/bin/bash
set -e

USER_HOME="/config"
USER_NAME="qwe"
VNC_PASSWORD="${VNC_PASSWORD:-114514}"

# TigerVNC 默认配置目录
VNC_CFG_DIR="$USER_HOME/.config/tigervnc"

# 如果已经初始化过，直接退出
if [ -f "$USER_HOME/.inited" ]; then
    echo "===== 系统已初始化，跳过 init ====="
    exit 0
fi

echo "===== 初始化用户目录和配置 ====="

# 修改 /config 权限
chown -R "$USER_NAME:$USER_NAME" "$USER_HOME"

# 拷贝 skel 配置文件到 /config
sudo -u "$USER_NAME" cp -vr /etc/skel/.z* "$USER_HOME/" || true

# 初始化 TigerVNC 密码
mkdir -p "$VNC_CFG_DIR"
echo "$VNC_PASSWORD" | vncpasswd -f > "$VNC_CFG_DIR/passwd"
chmod 600 "$VNC_CFG_DIR/passwd"
chown -R "$USER_NAME:$USER_NAME" "$VNC_CFG_DIR"

# 创建初始化标记文件
touch "$USER_HOME/.inited"
chown "$USER_NAME:$USER_NAME" "$USER_HOME/.inited"

echo "===== 初始化完成 ====="
