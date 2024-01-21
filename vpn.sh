if test -d cfgs; then
	wget https://my.surfshark.com/vpn/api/v1/server/configurations -o cfgs/
fi

server_name=$(ls cfgs/ | grep us | grep dal |  grep udp)

username="username"
password="password"

echo $username >> tmp
echo $password >> tmp

sudo openvpn --config cfgs/$server_name --auth-user-pass tmp

rm tmp
