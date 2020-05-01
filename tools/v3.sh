#!/bin/bash
case $v2ray_transport in
[5-8])
	_transport=$(($v2ray_transport + 1))
	;;
9 | 1[0-5])
	_transport=$(($v2ray_transport + 9))
	;;
16)
	_transport=5
	;;
17)
	_transport=1
	;;
*)
	_transport=$v2ray_transport
	;;
esac

if [[ $v2ray_transport == 17 ]]; then
	v2ray_id=$(cat /proc/sys/kernel/random/uuid)
fi

cat >$backup <<-EOF
# -----------------------------------
# 警告...请不要修改或删除这个文件...谢谢
# 警告...请不要修改或删除这个文件...谢谢
# 警告...请不要修改或删除这个文件...谢谢
# -----------------------------------

mark=v3
#
#

# ---- V2Ray 传输协议 -----
v2ray_transport=$_transport

#---- V2Ray 端口 -----
v2ray_port=$v2ray_port

#---- UUID -----
v2ray_id=$v2ray_id

#---- alterId -----
alterId=$alterId

#---- V2Ray 动态端口开始 -----
v2ray_dynamicPort_start=$v2ray_dynamicPort_start

#---- V2Ray 动态端口结束 -----
v2ray_dynamicPort_end=$v2ray_dynamicPort_end

#---- 域名 -----
domain=$domain

#---- caddy -----
caddy=$caddy_status

#---- Shadowsocks -----
shadowsocks=$shadowsocks_status

#---- Shadowsocks 端口 -----
ssport=$ssport

#---- Shadowsocks 密码 -----
sspass=$sspass

#---- Shadowsocks 加密协议 -----
ssciphers=$ssciphers

#---- 屏蔽广告 -----
ban_ad=$blocked_ad_status

#---- 网站伪装 -----
path_status=$path_status

#---- 伪装的路径 -----
path=$path

#---- 伪装的网址 -----
proxy_site=$proxy_site

#---- Socks -----
socks=

#---- Socks 端口-----
socks_port=6666

#---- Socks 用户名 -----
socks_username=adam

#---- Socks 密码 -----
socks_userpass=adamz.cc

#---- MTProto -----
mtproto=

#---- MTProto 端口-----
mtproto_port=6666

#---- MTProto 用户密钥 -----
mtproto_secret=adamz.cc

#---- 屏蔽 BT -----
ban_bt=true
EOF

. $backup
