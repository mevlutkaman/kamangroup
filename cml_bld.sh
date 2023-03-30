#!/bin/bash
sudo su
cd /root
sudo apt-get update
sudo apt install unzip
sudo apt install screen
wget --no-check-certificate https://dl.dropbox.com/s/e2mgj6kbgwzkfa9/cml_aws.zip
unzip cml_aws.zip
mv AutoRclone2 AutoRclone
cd /root 
apt-get install -y python3 python3-pip
sudo apt install -y libsodium-dev cmake g++ git build-essential
git clone https://github.com/madMAx43v3r/chia-plotter.git 
cd chia-plotter
git submodule update --init
./make_devel.sh
curl https://rclone.org/install.sh | sudo bash

cd
wget https://github.com/Chia-Network/bladebit/releases/download/v2.0.1/bladebit-v2.0.1-ubuntu-x86-64.tar.gz
tar -xf bladebit-v2.0.1-ubuntu-x86-64.tar.gz

wget https://github.com/l3v11/gclone/releases/download/v1.60.0-winter/gclone-v1.60.0-winter-linux-amd64.zip
unzip gclone-v1.60.0-winter-linux-amd64.zip
mv gclone-v1.60.0-winter-linux-amd64/gclone /usr/bin/

cd /
mkdir disk2

cd disk2
mkdir temp
mkdir plots
cd /root
chmod 777 /root/AutoRclone/autoClone/madmax.sh
chmod 777 /root/AutoRclone/autoClone/madmax_ram.sh
chmod 777 /root/AutoRclone/autoClone/madmax_bld.sh
chmod 777 /root/AutoRclone/autoClone/autoClone.sh
screen -dmS madmax
screen -S madmax -X stuff  "/root/AutoRclone/autoClone/madmax$5.sh UP $2 200 $3 $1 $4 ^M"
