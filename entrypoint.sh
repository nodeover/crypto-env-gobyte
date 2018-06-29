#!/bin/bash

chown crypto.crypto /home/crypto/gobyte -R
chown crypto.crypto /home/crypto/.gobytecore -R

source /home/crypto/gobyte/venv/bin/activate
gobyted -daemon
sudo cron
echo "[$APP_NAME Server Started]"
# tail -f /dev/null