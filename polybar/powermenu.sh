#!/bin/bash

choice=$(echo -e " Lock\n󰤄 Suspend\n󰐦 Shutdown\n󰑐 Reboot\n󰗽 Logout" | rofi -dmenu -i -p "Power Menu")

case "$choice" in
    " Lock")
        i3lock
        ;;
    "󰤄 Suspend")
        systemctl suspend
        ;;
    "󰐦 Shutdown")
        systemctl poweroff
        ;;
    "󰑐 Reboot")
        systemctl reboot
        ;;
    "󰗽 Logout")
        i3-msg exit
        ;;
    *)
        ;;
esac

