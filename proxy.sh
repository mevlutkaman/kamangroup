#!/bin/bash

# SSH kullanıcı adı
username="root"

# SSH bağlantı noktası
port="22"

# Hedef IP adresi
ip="74.208.22.59"

# SSH şifresi
password="Serhildanroot.123"

# Squid Proxy Sunucusu kullanıcı adı ve şifresi
squid_user="mdkroot"
squid_password="mdkroot"

# Squid Proxy Sunucusu kurulumu ve yapılandırması
sshpass -p $password ssh -o StrictHostKeyChecking=no $username@$ip -p $port << EOF
sudo apt-get update
sudo apt-get -y install squid apache2-utils
sudo touch /etc/squid/passwd
sudo chown proxy /etc/squid/passwd
sudo chmod o+r /etc/squid/passwd
sudo htpasswd -cb /etc/squid/passwd $squid_user $squid_password
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
sudo bash -c 'cat <<EOT > /etc/squid/squid.conf
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Squid Basic Authentication
auth_param basic credentialsttl 2 hours
acl auth_users proxy_auth REQUIRED
http_access allow auth_users
http_access deny all
http_port 3128
EOT'
sudo systemctl restart squid
EOF
