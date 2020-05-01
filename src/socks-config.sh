# Socks config
if [[ $socks ]]; then
	socks_file="/etc/v2ray/adam/v2ray/config/server/include/socks.json"
	socks_file_tmp="/tmp/socks.json.tmp"
	cp -f $socks_file $socks_file_tmp
	sed -i "s/6666/$socks_port/; s/adamz.cc/$socks_username/; s/adamz.cc/$socks_userpass/" $socks_file_tmp
	sed -i "/\/\/include_socks/r $socks_file_tmp" $v2ray_server_config
	sed -i "s#//include_socks#,#" $v2ray_server_config
	rm -rf $socks_file_tmp
fi