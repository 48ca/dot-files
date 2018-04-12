#!/bin/bash

apps=$(cat << EOF
spotify
chrome
chrome-dev
scrot
firefox
evince
urxvt
pavucontrol
discord
EOF
)

chosen=$(echo -e "$apps" | dmenu -i)

case "$chosen" in
    spotify) spotify --force-device-scale-factor=1.5  & ;;
    chrome) google-chrome-stable --force-device-scale-factor=1.5 & ;;
    chrome-dev) google-chrome-unstable --force-device-scale-factor=1.5 & ;;
    discord) notify-send "Discord not available" -a "dmenu" & ;;
    urxvt) urxvtc & ;;
    scrot) bash ~/scripts/scrot.sh "-s" & ;;
    *) bash -c "$chosen" ;;
esac
