#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user
# Debug kpr adapt aarch64
sed -i 's/,arm/,aarch64/' package/luci-app-koolproxyR/Makefile
#Get Version
TAG_Ver=$(grep -o -e 'R20.[[:digit:]].[[:digit:]]' package/lean/default-settings/files/zzz-default-settings)
