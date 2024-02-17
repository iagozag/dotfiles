if [ -f "/usr/bin/swayidle" ]; then
    swayidle -w timeout 600 'swaylock -f' timeout 660 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
    echo "swayidle not installed."
fi;
