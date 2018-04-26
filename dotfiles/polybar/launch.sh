#!/usr/bin/env sh

BAR_NAME="mybar"

# Terminate already running bar instances
killall -q polybar


echo "Bars launched..."

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload ${BAR_NAME}&
    done
else
    polybar --reload ${BAR_NAME}&
fi
