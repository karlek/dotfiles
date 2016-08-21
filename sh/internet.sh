#!/bin/fish
pkill wpa_supplicant
pkill dhcpcd
sleep 1
wpa_supplicant -i wlp4s0 -c /etc/wpa_supplicant.conf &
dhcpcd wlp4s0 &
