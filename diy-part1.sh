#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# 启用旧版Luci
sed -i 's/^#\(.*luci\)/\1/' feeds.conf.default
sed -i '/src-git.*openwrt-23/s/^/#/' feeds.conf.default
sed -i '/src-git.*openwrt-24/s/^/#/' feeds.conf.default
sed -i '/src-git.*openwrt-25/s/^/#/' feeds.conf.default

# Add a feed source
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone --depth=1 https://github.com/fw876/helloworld


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
sed -i '2s/^#//' feeds.conf.default
sed -i '3s/^/#/' feeds.conf.default
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# git clone -b lua https://github.com/sbwml/luci-app-alist package/alist
# git clone https://github.com/rufengsuixing/luci-app-onliner package/onliner
