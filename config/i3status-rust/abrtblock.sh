#!/usr/bin/sh

if [ "$1" == "-show" ]; then
  TEXT=$(abrt)
  CLEAROPT="Clear last ABRT error"
  SEL=$(echo -e "$TEXT\n$CLEAROPT" | rofi -dmenu)
  case $SEL in
    $CLEAROPT)
      ERROR=$(abrt rm -f)
      notify-send "Removed ABRT error" "$ERROR"
      ;;
  esac
else
  ABRT=$(abrt ls | grep "Component" | wc -l)
  if [ $ABRT == "0" ]; then
    echo "{\"text\": \"\"}"
    #echo ""
  else
    echo "{\"text\": \" $ABRT\"}"
  fi
fi
