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

svn co https://github.com/jerrykuku/lua-maxminddb/trunk package/lua-maxminddb
svn co https://github.com/jerrykuku/luci-app-vssr/trunk package/luci-app-vssr
svn co https://github.com/rufengsuixing/luci-app-adguardhome/trunk package/luci-app-adguardhome
#git clone https://github.com/vernesong/OpenClash.git package/OpenClash
#cp -r package/OpenClash/luci-app-openclash package/
#rm -rf package/OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/brook package/brook
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/trojan-plus
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-filebrowser package/luci-app-filebrowser
#svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/filebrowser package/filebrowser
#svn co https://github.com/project-openwrt/openwrt/trunk/package/lienol/luci-app-fileassistant package/luci-app-fileassistant
svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
#cp -rf $GITHUB_WORKSPACE/general/luci-app-passwall package/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocks-rust package/shadowsocks-rust
#svn co https://github.com/fw876/helloworld/trunk/shadowsocks-rust package/shadowsocks-rust
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-core package/xray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/xray-plugin package/xray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ssocks package/ssocks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2socks package/dns2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/ipt2socks package/ipt2socks
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/microsocks 
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/pdnsd-alt package/pdnsd-alt
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/shadowsocksr-libev package/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/shadowsocksr-libev
#svn co https://github.com/fw876/helloworld/trunk/tcping package/tcping
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-core package/v2ray-core
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/v2ray-geodata package/v2ray-geodata
#svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/v2ray-plugin
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/simple-obfs
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/kcptun package/kcptun
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan package/trojan
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/hysteria package/hysteria
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/dns2tcp package/dns2tcp
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/sagernet-core package/sagernet-core
#svn co https://github.com/fw876/helloworld/trunk/xray-core package/xray-core
#svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/xray-plugin
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus package/luci-app-ssr-plus
#svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/naiveproxy
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/naiveproxy package/naiveproxy
git clone https://github.com/semigodking/redsocks.git package/redsocks2
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server

svn co https://github.com/halldong/luci-app-speederv2/trunk package/luci-app-speederv2

#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-gost package/luci-app-gost
#svn co https://github.com/kenzok8/openwrt-packages/trunk/gost package/gost
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-gost package/luci-app-gost
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/gost package/gost

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos

#添加smartdns
#svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/smartdns package/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
#svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns-le package/smartdns-le
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-smartdns package/luci-app-smartdns

#mosdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/mosdns package/mosdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns

#svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-socat package/luci-app-socat

svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon package/wrtbwmon
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
cd luci-app-wrtbwmon
git reset --hard ff7773abbf71120fc39a276393b29ba47353a7e2
cp -r luci-app-wrtbwmon ../package/
cd ..

#添加subweb&subconverter
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/quickjspp package/quickjspp
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/jpcre2 package/jpcre2
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/libcron/ package/libcron
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/rapidjson package/rapidjson
#svn co https://github.com/immortalwrt/immortalwrt/trunk/package/ctcgfw/subweb package/subweb
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/subconverter package/subconverter
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/libs/toml11 package/toml11

#添加istore
svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
sed -i 's/luci-lib-ipkg/luci-base/g' package/luci-app-store/Makefile

#添加udp2raw
#git clone https://github.com/sensec/openwrt-udp2raw package/openwrt-udp2raw
#git clone https://github.com/sensec/luci-app-udp2raw package/luci-app-udp2raw
#sed -i "s/PKG_SOURCE_VERSION:=.*/PKG_SOURCE_VERSION:=f2f90a9a150be94d50af555b53657a2a4309f287/" package/openwrt-udp2raw/Makefile
#sed -i "s/PKG_VERSION:=.*/PKG_VERSION:=20200920\.0/" package/openwrt-udp2raw/Makefile
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/udp2raw package/udp2raw
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-udp2raw package/luci-app-udp2raw

#添加luci-app-advanced
git clone https://github.com/sirpdboy/luci-app-advanced package/luci-app-advanced

#添加luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#修改晶晨宝盒默认配置

# 1.Set the download repository of the OpenWrt files to your github.com
sed -i "s|https.*/OpenWrt|https://github.com/superman110/Docker-Openwrt-N1|g" package/luci-app-amlogic/root/etc/config/amlogic

# 2.Set the keywords of Tags in your github.com Releases
#sed -i "s|ARMv8|ARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic

# 3.Set the suffix of the OPENWRT files in your github.com Releases
sed -i "s|.img.gz|_FOL+SFE.img.gz|g" package/luci-app-amlogic/root/etc/config/amlogic

# 4.Set the download path of the kernel in your github.com repository
sed -i "s|opt/kernel|BuildARMv8|g" package/luci-app-amlogic/root/etc/config/amlogic

#添加argon-config 使用 最新argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
rm -rf feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

#修改makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHREPO/PKG_SOURCE_URL:=https:\/\/github\.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=\@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload\.github\.com/g' {}

find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-alt/shadowsocksr-libev-ssr-redir/g' {}
find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-vssr/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-server/shadowsocksr-libev-ssr-server/g' {}

#修改bypass的makefile
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-redir/shadowsocksr-libev-alt/g' {}
#find package/*/ feeds/*/ -maxdepth 2 -path "*luci-app-bypass/Makefile" | xargs -i sed -i 's/shadowsocksr-libev-ssr-server/shadowsocksr-libev-server/g' {}

svn co https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/luci-app-bypass
#find package/luci-app-bypass/* -maxdepth 8 -path "*" | xargs -i sed -i 's/smartdns-le/smartdns/g' {}

./scripts/feeds update -a
./scripts/feeds install -a
