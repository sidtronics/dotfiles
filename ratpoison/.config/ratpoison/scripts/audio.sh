#!/bin/sh

# Script for Audio pop-up notifications.
# For this script to work you need pamixer, dunst.
# By Siddhesh Dharme <siddheshdharme18@gmail.com>

timeout=1500
ICON_PATH="$HOME/.config/ratpoison/icons/"

case $1 in

    inc)
        pamixer -i 2
        volume=$(pamixer --get-volume)
        notify-send Volume $volume% -t $timeout -u low -i $ICON_PATH/audio-volume-high-symbolic.svg -h int:value:$volume -h string:x-dunst-stack-tag:volume 
    ;;

    dec)
        pamixer -d 2
        volume=$(pamixer --get-volume)
        notify-send Volume $volume% -t $timeout -u low -i $ICON_PATH/audio-volume-high-symbolic.svg -h int:value:$volume -h string:x-dunst-stack-tag:volume
    ;;

    mute)
        pamixer -t
        if [ $(pamixer --get-mute) = "true" ]; then
            notify-send Volume Mute -t $timeout -u low -i $ICON_PATH/audio-volume-muted-symbolic.svg -h string:x-dunst-stack-tag:volume
        else
            notify-send Volume Unmute -t $timeout -u low -i $ICON_PATH/audio-volume-high-symbolic.svg -h string:x-dunst-stack-tag:volume
        fi
    ;;

    mmute)
        pamixer --default-source -t
        if [ $(pamixer --default-source --get-mute) = "true" ]; then
            notify-send "Mic Status" Mute -t $timeout -u low -i $ICON_PATH/microphone-sensitivity-muted-symbolic.svg -h string:x-dunst-stack-tag:volume
        else
            notify-send "Mic Status" Unmute -t $timeout -u low -i $ICON_PATH/microphone-sensitivity-high-symbolic.svg -h string:x-dunst-stack-tag:volume
        fi
    ;;

esac
