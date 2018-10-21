#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Run script as ROOT please. (sudo !!)"
    exit
fi

echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list.d/stretch.$
cat > /etc/apt/preferences << "EOF"
Package: *
Pin: release n=jessie
Pin-Priority: 600
EOF

## Updating Raspberry
apt update -y
apt upgrade -y
apt dist-upgrade -y

## Instaling LAMP
echo "Instaling LAMP
wget "https://raw.githubusercontent.com/JorgePlk/Raspberry-Scritps/master/LAMP.sh"
bash LAMP.sh
rm LAMP.sh
