#!/bin/bash

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    touch $cache_file
    echo "$HOME/wallpapers/default.jpg" > "$cache_file"
fi

# Create rasi file if not exists
if [ ! -f $rasi_file ] ;then
    touch $rasi_file
    echo "* { current-image: url(\"$HOME/wallpapers/default.jpg\", height); }" > "$rasi_file"
fi

current_wallpaper=$(cat "$cache_file")

case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        if [ -f $cache_file ]; then
            wal -q -i $current_wallpaper
        else
            wal -q -i ~/wallpapers/
        fi
    ;;

    # Select wallpaper with rofi
    "select")

        selected=$( find "$HOME/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read rfile
        do
            echo -en "$rfile\x00icon\x1f$HOME/wallpapers/${rfile}\n"
        done | rofi -dmenu -replace -config ~/.config/rofi/config-wallpaper.rasi)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        wal -q -i ~/wallpapers/$selected
    ;;

    # Randomly select wallpaper 
    *)
        wal -q -i ~/wallpapers/
    ;;

esac

# ----------------------------------------------------- 
# Load current pywal color scheme
# ----------------------------------------------------- 
source "$HOME/.cache/wal/colors.sh"
echo "Wallpaper: $wallpaper"

# ----------------------------------------------------- 
# Write selected wallpaper into .cache files
# ----------------------------------------------------- 
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$wallpaper\", height); }" > "$rasi_file"

# ----------------------------------------------------- 
# Update wallpaper config into hyprpaper file
# -----------------------------------------------------
hyprpaper_path="$HOME/.config/hypr/hyprpaper.conf"

$(sed -i '2,3s/.*/ /' "$hyprpaper_path")
echo "splash = true" > $hyprpaper_path
echo "preload = $wallpaper" >> $hyprpaper_path
echo "wallpaper = , $wallpaper" >> $hyprpaper_path

# ----------------------------------------------------- 
# Update color config into alacritty file
# -----------------------------------------------------
cp ~/.cache/wal/colors-alacritty.toml ~/.config/alacritty/themes

# ----------------------------------------------------- 
# Update color config into spicetify file
# -----------------------------------------------------
# cp ~/.cache/wal/color.ini ~/.config/spicetify/Themes/wal-theme

# ----------------------------------------------------- 
# Update color config into dunst file
# -----------------------------------------------------
dunst_config_file="$HOME/.config/dunst/dunstrc"
sed -i "s|^    frame_color =.*|    frame_color = \"$color1\"|" "$dunst_config_file"
killall dunst

# ----------------------------------------------------- 
# Update wallpaper config into swaylock file
# -----------------------------------------------------
swaylock_config_file="$HOME/.config/swaylock/config"
sed -i "s|^image=.*$|image=$wallpaper|" "$swaylock_config_file"

# ----------------------------------------------------- 
# get wallpaper image name
# ----------------------------------------------------- 
newwall=$(echo $wallpaper | sed "s|$HOME/wallpapers/||g")

# ----------------------------------------------------- 
# Reload config
# -----------------------------------------------------
~/.config/hypr/scripts/launch.sh

source ~/.zshrc

# ----------------------------------------------------- 
# Send notification
# ----------------------------------------------------- 
sleep 1
notify-send "Colors and Wallpaper updated" "with image $newwall"

echo "DONE!"

