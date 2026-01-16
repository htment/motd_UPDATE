#!/bin/bash
# Получаем основной IP-адрес
IP_ADDR=$(ip -4 addr show scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1)

# Если IP нет, используем localhost
[ -z "$IP_ADDR" ] && IP_ADDR="127.0.0.1"

# Обновляем MOTD
cat > /etc/motd << EOF
# BEGIN ANSIBLE MANAGED BLOCK
Добро пожаловать на наш сервер!
Сегодня $(date '+%a %d %b %Y %H:%M:%S %Z').
Hostname: $(hostname)
IP-адрес: $IP_ADDR
Желаю хорошего дня, системному администратору!
# END ANSIBLE MANAGED BLOCK
EOF
