#!/usr/bin/sh

CURRENT_POWER=$(powerprofilesctl get)
POWER_OPTS=$(echo $(powerprofilesctl | grep -vx "^    .*" | grep -vx "^" | sed 's/://g ; s/*/ /g ; s/ //g') | sed 's/ /|/g')
CURRENT_GFX=$(supergfxctl -g)
GFX_OPTS=$(echo $(supergfxctl -s | sed 's/\[//g ; s/\]//g ; s/, /\n/g') | sed 's/ /|/g')

INPUTS=$(zenity --forms --text="$CURRENT_GFX $CURRENT_POWER" --add-combo="GPU Profile" --combo-values="|$GFX_OPTS" --add-combo="Power profile" --combo-values="|$POWER_OPTS")

GFX=$(echo $INPUTS | grep -o "^.*|" | sed 's/|//g')
POWER=$(echo $INPUTS | grep -o "|.*$" | sed 's/|//g')

echo "{$POWER}"
echo "{$GFX}"

if [[ $POWER != "" ]]; then
  sh -c "powerprofilesctl set $POWER"
else
  echo "POWER $POWER is invalid. Skipping..."
fi
if [[ $GFX != "" ]]; then
  OUTPUT=$(sh -c "supergfxctl -m $GFX")
  notify-send "$OUTPUT"
else
  echo "GFX $GFX is invalid. Skipping..."
fi
