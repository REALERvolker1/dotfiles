#!/usr/bin/sh

numlockx
IDT=$(xinput | grep -i "touchpad" | grep -o "id=.." | grep -o "[0-9].")
xinput set-prop $IDT "libinput Tapping Enabled" 1
xinput set-prop $IDT "libinput Natural Scrolling Enabled" 1
printf "\nTouchpad stage done, some errors before now are okay\n\n"
if xinput | grep "Model O"; then
  IDS=$(xinput | grep "O Wireless  " | grep -o "id=.." | grep -o "[0-9].")
  ID0=$(echo $IDS | grep -o "^..")
  ID1=$(echo $IDS | grep -o "..$")
  xinput set-prop "$ID0" "libinput Button Scrolling Button" 8
  xinput set-prop "$ID1" "libinput Button Scrolling Button" 8
  xinput set-prop "$ID0" "libinput Accel Profile Enabled" 0, 1
  xinput set-prop "$ID1" "libinput Accel Profile Enabled" 0, 1
  xinput set-prop "$ID0" "libinput Scroll Method Enabled" 0, 0, 1
  xinput set-prop "$ID1" "libinput Scroll Method Enabled" 0, 0, 1
  xinput disable $IDT
else
  xinput enable $IDT
fi
