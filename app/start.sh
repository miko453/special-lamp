#!/bin/bash
set -e

# 执行初始化（如果已经初始化过，init.sh 会自动跳过）
sudo /app/init.sh

# 启动 VNC 服务器，前台运行
vncserver :1 -localhost no -SecurityTypes RA2_256 -fg

