#!/usr/bin/sh

POWER="/sys/class/power_supply"
PREV_CAPACITY=0
PREV_ADAPTER=0
AC="$POWER/ACAD"
BAT="$POWER/BAT1"
MAX="70"

asusctl -c $MAX
#lxqt-powermanagement &
while true; do
  #capacity="$(cat $BAT/capacity)"
  adapter="$(cat $AC/online)"
  if [[ $adapter -eq "1" ]]; then
    powerprofilesctl set performance
    dbus-send --system --type=method_call  --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:3
    light -S 75
  else
    powerprofilesctl set power-saver
    dbus-send --system --type=method_call  --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:0
    light -S 50
  fi
  inotifywait -qe open $AC/online
done
