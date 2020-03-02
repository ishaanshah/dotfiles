#!/bin/bash

# Get number of displays connected
num=`xrandr --query | grep " connected" | cut -d" " -f1 | wc -l`

# Change screenlayout according to number of screens connected
if (( num == 1 )); then
    xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --off
    echo "Monitor disconnected"
else
    xrandr --output eDP-1 --mode 1366x768 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal
    echo "Monitor connected"
fi

# Restart i3wm
i3-msg restart
