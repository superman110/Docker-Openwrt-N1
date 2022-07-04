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

#移除不用软件包    
rm -rf feeds/luci/applications/luci-app-wrtbwmon
rm -rf feeds/packages/net/smartdns
rm -rf feeds/packages/net/mosdns

#添加额外软件包

svn co https://github.com/kenzok8/openwrt-packages/trunk/lua-maxminddb package/lua-maxminddb
svn co https://github.com/kenzok8/openwrt-packages/trunk/naiveproxy package/naiveproxy
svn co https://github.com/kenzok8/openwrt-packages/trunk/redsocks2 package/redsocks2
svn co https://github.com/kenzok8/openwrt-packages/trunk/tcping package/tcping
svn co https://github.com/kenzok8/openwrt-packages/trunk/microsocks package/microsocks
svn co https://github.com/kenzok8/openwrt-packages/trunk/sagernet-core package/sagernet-core
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-vssr package/luci-app-vssr
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-bypass package/luci-app-bypass
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall2 package/luci-app-passwall2
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
svn co https://github.com/kenzok8/small/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/kenzok8/small/trunk/brook package/brook
svn co https://github.com/kenzok8/small/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/kenzok8/small/trunk/trojan-go package/trojan-go
svn co https://github.com/kenzok8/small/trunk/trojan-plus package/trojan-plus
svn co https://github.com/kenzok8/small/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/kenzok8/small/trunk/xray-core package/xray-core
svn co https://github.com/kenzok8/small/trunk/xray-plugin package/xray-plugin
svn co https://github.com/kenzok8/small/trunk/ssocks package/ssocks
svn co https://github.com/kenzok8/small/trunk/dns2socks package/dns2socks
svn co https://github.com/kenzok8/small/trunk/ipt2socks package/ipt2socks
svn co https://github.com/kenzok8/small/trunk/pdnsd-alt package/pdnsd-alt
svn co https://github.com/kenzok8/small/trunk/v2ray-core package/v2ray-core
svn co https://github.com/kenzok8/small/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/kenzok8/small/trunk/v2ray-geodata package/v2ray-geodata
svn co https://github.com/kenzok8/small/trunk/simple-obfs package/simple-obfs
svn co https://github.com/kenzok8/small/trunk/trojan package/trojan
svn co https://github.com/kenzok8/small/trunk/hysteria package/hysteria
svn co https://github.com/kenzok8/small/trunk/dns2tcp package/dns2tcp

#添加adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome

#添加smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns

#mosdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/mosdns package/mosdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns

#添加istore
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-store package/luci-app-store
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile

#添加luci-app-amlogic
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-amlogic package/luci-app-amlogic
#修改晶晨宝盒默认配置

# 1.Set the download repository of the OpenWrt files to your github.com
sed -i "s|https.*/OpenWrt|https://github.com/superman110/Docker-Openwrt-N1|g" package/luci-app-amlogic/root/etc/config/amlogic

# 2.Set the keywords of Tags in your github.com Releases
#sed -i "s|ARMv8|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic

# 3.Set the suffix of the OPENWRT files in your github.com Releases
#sed -i "s|.img.gz|_FOL+SFE.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic

# 4.Set the download path of the kernel in your github.com repository
sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic

#添加argon-config 使用 最新argon
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config
rm -rf feeds/luci/themes/luci-theme-argon
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argon

svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
cd luci-app-wrtbwmon
git reset --hard ff7773abbf71120fc39a276393b29ba47353a7e2
cp -r luci-app-wrtbwmon ../package/

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' {}

./scripts/feeds update -a
./scripts/feeds install -a
