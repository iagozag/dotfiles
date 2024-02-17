#!/bin/bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown=$'\Uf0425'
reboot=$'\Uf0709'
lock=$'\Uf033e'
logout=$'\Uf0343'
yes=$''
no=$'\Uf0156'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Goodbye ${USER}" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/config-powermenu.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/confirm.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"

case ${chosen} in
    $shutdown)
	    systemctl poweroff	
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
	    swaylock 
        ;;
    $logout)
	    hyprctl dispatch exit 0	
        ;;
esac
