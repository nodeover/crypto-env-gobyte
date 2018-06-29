#!/bin/bash

sudo /home/crypto/gobyte/venv/bin gobyted -daemon
sudo cron -f
echo "[$APP_NAME Server Started]"
# tail -f /dev/null