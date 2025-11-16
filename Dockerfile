FROM kalilinux/kali-rolling

# 复制 app 文件夹，赋予脚本可执行权限，并执行安装
COPY app /app
RUN chmod +x /app/*.sh && /app/install.sh

# 切换到普通用户 qwe
USER qwe

# 容器启动时执行 start.sh
CMD ["/app/start.sh"]

