#!/bin/bash
# __  ______   ____ 
# \ \/ /  _ \ / ___|
#  \  /| | | | |  _ 
#  /  \| |_| | |_| |
# /_/\_\____/ \____|
#                   
# ----------------------------------------------------- 

# kill all possible running xdg-desktop-portals
killall xdg-desktop-portal-hyprland
killall xdg-desktop-portal-wlr
killall xdg-desktop-portal-gtk
killall xdg-desktop-portal

# start xdg-desktop-portal-hyprland
/usr/lib/xdg-desktop-portal-hyprland &

# start xdg-desktop-portal
/usr/lib/xdg-desktop-portal &

