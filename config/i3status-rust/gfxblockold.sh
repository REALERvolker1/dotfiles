#!/usr/bin/sh

PROC=$(lsof /dev/nvidia0 | wc -l)
STAT=$(supergfxctl -S)
STAT=$(cat '/sys/bus/pci/devices/0000:01:00.0/power/runtime_status')
ICON=''


if [[ $PROC -eq 0 ]]; then
  PROC=""
else
  PROC="  $PROC"
fi



if [[ $STAT -eq 'active' ]]; then
  ICON='閭'
elif [[ $STAT -eq 'suspended' ]]; then
  ICON='礪'
else
  ICON='濾'
fi


echo "{\"text\": \"$ICON$PROC\"}"
#while true; do
#  setGPU
#  echo "{\"text\": \"$ICON\"}"
#  inotifywait -qe open '/sys/bus/pci/devices/0000:01:00.0/power/runtime_status' >> /dev/null
#done


#echo "{\"icon\": \"$ICON\", \"state\": \"Idle\", \"text\": \"$PROC\"}"
#

