#!/bin/bash

sudo chown crypto.crypto /home/crypto/gobyte -R
sudo chown crypto.crypto /home/crypto/.gobytecore -R

source /home/crypto/gobyte/venv/bin/activate
gobyted -daemon
sudo cron -f
echo "[$APP_NAME Server Started]"
# tail -f /dev/null