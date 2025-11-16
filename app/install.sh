#!/bin/bash
set -e

echo "===== 开始执行安装模块 ====="

# 遍历 setup 目录下的所有 .sh 文件并执行
for script in /app/setup/*.sh; do
    if [ -x "$script" ]; then
        echo "===== 执行 $script ====="
        "$script"
    else
        echo "===== 给 $script 添加可执行权限并执行 ====="
        chmod +x "$script"
        "$script"
    fi
done

echo "===== 所有模块安装完成 ====="

