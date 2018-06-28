#!/bin/bash

source /home/crypto/gobyte/venv/bin/activate
gobyted -daemon
sudo cron
echo "[$APP_NAME Server Started]"
tail -f /dev/null
