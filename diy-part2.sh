#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.11/g' package/base-files/files/bin/config_generate

#修改晶晨宝盒默认配置

# 1.Set the download repository of the OpenWrt files to your github.com
sed -i "s|https.*/OpenWrt|https://github.com/superman110/Docker-Openwrt-N1|g" package/luci-app-amlogic/root/etc/config/amlogic

# 2.Set the keywords of Tags in your github.com Releases
#sed -i "s|ARMv8|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic

# 3.Set the suffix of the OPENWRT files in your github.com Releases
#sed -i "s|.img.gz|_FOL+SFE.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic

# 4.Set the download path of the kernel in your github.com repository
sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic
