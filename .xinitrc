#!/bin/sh

# Fix touch-pad scrolling.
ibm_trackpad_id=$(xinput | grep 'TPPS' | cut -d"=" -f2 | cut -f1)
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation" 1
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Button" 2
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Timeout" 200
xinput set-prop $ibm_trackpad_id "Evdev Wheel Emulation Axes" 7 6 5 4

redshift -l 59.2681907:18.013906 -t 5500:3000 &

# Load Xresources for all X programs.
xrdb ~/.Xresources

# Urxvt daemon.
urxvtd -q -f -o

# Add support for keyboard mouse clicks.
xkbset m

# Load keyboard changes from .Xmodmap.
xmodmap ~/.Xmodmap

# Start i3.
exec i3 --shmlog-size=26214400 -V >> ~/.config/i3/i3log-$(date +'%F-%k-%M-%S').log 2>&1

