#!/usr/bin/bash
export USER_NAME=_
export USER_ID=$(id -u $USER_NAME)

export XAUTHORITY=/run/user/$USER_ID/X/authority
export DISPLAY=:0.0

export HDMI_STATUS=$(</sys/class/drm/card0/card0-HDMI-A-2/status)

export PULSE_SERVER="unix:/run/user/"$USER_ID"/pulse/native"

echo "---" >> /tmp/status
if [[ $HDMI_STATUS == connected ]]
then
   /usr/bin/xrandr >> /tmp/status
   sudo -u $USER_NAME /usr/bin/pactl --server $PULSE_SERVER set-card-profile 0 output:hdmi-stereo-extra1 2>>/tmp/status
   sudo -u $USER_NAME /usr/bin/xrandr --output eDP1 --mode 1920x1080  2>> /tmp/status
   sudo -u $USER_NAME /usr/bin/xrandr --output HDMI2 --mode 1920x1080 --rate 60 2>> /tmp/status
   /usr/bin/pactl set-default-sink $(pactl list short sinks | grep hdmi | awk '{print $1}') 2>> /tmp/status
   sudo -u $USER_NAME /usr/bin/bash /home/_/sh/random.sh 2>> /tmp/status
   echo "both" >> /tmp/status
else
   sudo -u $USER_NAME /usr/bin/pactl --server $PULSE_SERVER set-card-profile 0 output:hdmi-stereo-extra1 2>>/tmp/status
   sudo -u $USER_NAME /usr/bin/pactl --server $PULSE_SERVER set-card-profile 0 off 2>> /tmp/status
   sudo -u $USER_NAME /usr/bin/pactl --server $PULSE_SERVER set-card-profile 1 output:analog-stereo+input:analog-stereo 2>> /tmp/status
   sudo -u $USER_NAME /usr/bin/xrandr --output eDP1 --mode 2560x1440 --output HDMI2 --off 2>> /tmp/status
   /usr/bin/pactl set-default-sink $(pactl list short sinks | grep analog | awk '{print $1}')
   sudo -u $USER_NAME /usr/bin/bash /home/_/sh/random.sh 2>> /tmp/status
   echo "only" >> /tmp/status
fi
