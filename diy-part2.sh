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
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
sed -i 's/0.openwrt.pool.ntp.org/ntp.aliyun.com/g' package/base-files/files/bin/config_generate
sed -i 's/1.openwrt.pool.ntp.org/time1.cloud.tencent.com/g' package/base-files/files/bin/config_generate
sed -i 's/2.openwrt.pool.ntp.org/time.ustc.edu.cn/g' package/base-files/files/bin/config_generate
sed -i 's/3.openwrt.pool.ntp.org/cn.pool.ntp.org/g' package/base-files/files/bin/config_generate
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# 全局wifi名称更改
# sed -i 's/OpenWrt/bhyj/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' /etc/opkg/distfeeds.conf
sed -i '$d' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio1.ssid='MY_5G' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio1.encryption='psk2+ccmp' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio1.key='18606323535' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio1.country='US' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio0.htmode='HT40' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio0.band='2g' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio0.channel='1' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio0.noscan='1' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio0.ssid='MY' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio0.encryption='psk2+ccmp' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.default_radio0.key='18606323535 package/base-files/files/bin/config_generate'
sed -i '$a uci set wireless.default_radio0.country='US' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio1.disabled='0' package/base-files/files/bin/config_generate
sed -i '$a uci set wireless.radio0.disabled='0' package/base-files/files/bin/config_generate
sed -i '$a uci set system.@system[0].zonename='Asia/Shanghai' package/base-files/files/bin/config_generate
sed -i '$a uci set system.@system[0].timezone='GMT-8' package/base-files/files/bin/config_generate
sed -i '$a uci set upnpd.config.enabled='1' package/base-files/files/bin/config_generate
#sed -i '$a uci set ttyd.@ttyd[0].command='/bin/login -f root' package/base-files/files/bin/config_generate
sed -i '$a uci commit' package/base-files/files/bin/config_generate
