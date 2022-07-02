#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.11/g' package/base-files/files/bin/config_generate

# firewall custom
#echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# 1.Set the download repository of the OpenWrt files to your github.com
sed -i "s|https.*/OpenWrt|https://github.com/superman110/OpenWrt-AArch64|g" package/others/luci-app-amlogic/root/etc/config/amlogic
# 2.Set the keywords of Tags in your github.com Releases
sed -i "s|ARMv8|Phicomm_N1|g" package/others/luci-app-amlogic/root/etc/config/amlogic
# 3.Set the suffix of the OPENWRT files in your github.com Releases
#sed -i "s|.img.gz|.OPENWRT_SUFFIX|g" package/others/luci-app-amlogic/root/etc/config/amlogic
# 4.Set the download path of the kernel in your github.com repository
#sed -i "s|opt/kernel|https://github.com/breakings/OpenWrt/tree/main/opt/kernel|g" package/others/luci-app-amlogic/root/etc/config/amlogic


