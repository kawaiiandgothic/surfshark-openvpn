#!/usr/bin/env bash

stty -echo
if test -d cfgs; then
	wget https://my.surfshark.com/vpn/api/v1/server/configurations -o cfgs/
fi
stty echo

# e.g dallas texas server:  server_name=$(ls cfgs/ | grep us | grep dal |  grep udp)
server_name=$(ls cfgs/ | grep country | grep state|  grep type)

# https://my.surfshark.com/vpn/manual-setup/main/openvpn
username="username"
password="password"

echo $username >> tmp
echo $password >> tmp

sudo openvpn --config cfgs/$server_name --auth-user-pass tmp

rm tmp
