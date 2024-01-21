#!/usr/bin/env bash

stty -echo
if [ ! -d cfgs ]; then
	wget https://my.surfshark.com/vpn/api/v1/server/configurations
	mkdir cfgs
	cd cfgs
	unzip ../configurations
	rm configurations
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
