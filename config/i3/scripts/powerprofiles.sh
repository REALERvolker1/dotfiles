#!/usr/bin/sh

rofi_command="rofi"

rowsel=0

current=$(powerprofilesctl get)
case $current in
  "performance")
    rowsel=2
  ;;
  "balanced")
    rowsel=1
  ;;
  "power-saver")
    rowsel=0
  ;;
esac
qui="Quiet"
bal="Balanced"
per="Performance"

chosen="$(echo -e "$qui\n$bal\n$per" | $rofi_command -dmenu -selected-row $rowsel)"
case $chosen in
  $qui)
    powerprofilesctl set power-saver
  ;;
  $bal)
    powerprofilesctl set balanced
  ;;
  $per)
    powerprofilesctl set performance
  ;;
esac
