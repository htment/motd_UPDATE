# копируем

```
sudo cp update-motd-ip.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/update-motd-ip.sh
```
# Создаем сервис

```
sudo nano /etc/systemd/system/update-motd.service
```
```
[Unit]
Description=Update MOTD with current IP address
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/update-motd-ip.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

# Создаем systemd таймер для периодического обновления
```
sudo nano /etc/systemd/system/update-motd.timer
```
# Активируем
```
sudo systemctl daemon-reload
sudo systemctl enable --now update-motd.service
sudo systemctl enable --now update-motd.timer
```
