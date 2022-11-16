#!/usr/bin/sh

power_off="Shutdown"
reboot="Reboot"
lock="Lock"
suspend="Suspend"
log_out="Logout"
options="$reboot\n$power_off\n$log_out\n$suspend\n$lock"
chosen="$(echo -e "$options" | rofi -dmenu -selected-row 2)"
case $chosen in
  $power_off)
    systemctl poweroff
  ;;
  $reboot)
    systemctl reboot
  ;;
  $lock)
    i3lock -nFfki /home/vlk/Pictures/Backgrounds/treeHD1080.png --time-str="%r" --wrong-text=    "na" --radius 120 --inside-color="ffffff" --ring-color="7700ba" --line-color="ffffff" --ring-width 14
  ;;
  $suspend)
    systemctl suspend
  ;;
  $log_out)
    i3-msg exit
  ;;
esac
