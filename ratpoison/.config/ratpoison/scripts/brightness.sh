#!/bin/sh

# Script for brightness control pop-up notifications.
# For this script to work you need light, dunst.
# By Siddhesh Dharme <siddheshdharme18@gmail.com>

ICON_PATH="$HOME/.config/ratpoison/icons/"

case $1 in
    
    inc)
        light -A 2
        temp=$(light -G)
        brightness=${temp%???}
        notify-send Brightness $brightness% -t 1500 -u low -i $ICON_PATH/display-brightness-symbolic.svg -h int:value:$brightness% -h string:x-dunst-stack-tag:brightness
    ;;

    dec)
        light -U 2
        temp=$(light -G)
        brightness=${temp%???}
        notify-send Brightness $brightness% -t 1500 -u low -i $ICON_PATH/display-brightness-symbolic.svg -h int:value:$brightness% -h string:x-dunst-stack-tag:brightness
    ;;

esac
