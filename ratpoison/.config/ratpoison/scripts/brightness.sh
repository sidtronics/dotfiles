#!/bin/sh

# Script for brightness control pop-up notifications.
# For this script to work you need light, dunst.
# By Siddhesh Dharme <siddheshdharme18@gmail.com>

case $1 in
    
    inc)
        light -A 2
        brightness=$(light -G)
        notify-send Brightness $brightness% -t 1500 -u low -i display-brightness-symbolic -h int:value:$brightness% -h string:x-dunst-stack-tag:brightness
    ;;

    dec)
        light -U 2
        brightness=$(light -G)
        notify-send Brightness $brightness% -t 1500 -u low -i display-brightness-symbolic -h int:value:$brightness% -h string:x-dunst-stack-tag:brightness
    ;;

esac
