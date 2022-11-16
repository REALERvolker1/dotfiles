#!/usr/bin/sh

if xinput | grep "Model O"; then
  IDS=$(xinput | grep "O Wireless  " | grep -o "id=.." | grep -o "[0-9].")
  ID0=$(echo $IDS | grep -o "^..")
  ID1=$(echo $IDS | grep -o "..$")
  if xinput list-props "$ID0" | grep "libinput Scroll Method Enabled (" | grep "0, 0, 0"; then
    xinput set-prop "$ID0" "libinput Scroll Method Enabled" 0, 0, 1
  else
    xinput set-prop "$ID0" "libinput Scroll Method Enabled" 0, 0, 0
  fi
  if xinput list-props "$ID1" | grep "libinput Scroll Method Enabled (" | grep "0, 0, 0"; then
    xinput set-prop "$ID1" "libinput Scroll Method Enabled" 0, 0, 1
  else
    xinput set-prop "$ID1" "libinput Scroll Method Enabled" 0, 0, 0
  fi
fi
