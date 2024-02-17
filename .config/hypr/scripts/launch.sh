#!/bin/bash

killall waybar
pkill waybar

killall hyprpaper
pkill hyprpaper

sleep 0.2

# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config.jsonc"
style_file="style.css"

waybar -c ~/.config/waybar/$config_file -s ~/.config/waybar/$style_file &
hyprpaper &
~/.config/hypr/scripts/autolockscreen.sh &
dunst &
disown

