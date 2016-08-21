#!/bin/sh

# tpset() { xinput set-prop "TPPS/2 IBM TrackPoint" "$@"; }

ibm_trackpad_id=$(xinput | grep 'TPPS' | cut -d"=" -f2 | cut -f1)

xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation" 1
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Button" 2
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Timeout" 200
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Axes" 7 6 5 4
# tpset "Device Accel Constant Deceleration" 0.50

redshift -l 59.2681907:18.013906 -t 5500:3000 &

#export GOPATH="/home/_/go"
#export PATH=$PATH:$GOPATH/bin

# Remove caps lock and insert
setxkbmap -option caps:none &
xmodmap -e "keycode 118=" &
xmodmap -e "keycode  107 = Menu NoSymbol Menu" &

exec openbox-session
