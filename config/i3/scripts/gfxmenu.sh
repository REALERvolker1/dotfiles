#!/usr/bin/sh

function mode_select () {
  local modes_available_unformatted=$(supergfxctl -s)
  local modes_available_work=$(echo ${modes_available_unformatted,,})
  local modes_available=$(echo $modes_available_work | sed -e 's/, /\\n/g' -e 's/\[//g' -e 's/\]//g')
  local current_mode="Current mode: $(supergfxctl -g)"
  #echo -e $modes_available
  local selected=$(echo -e "$modes_available\\n$current_mode" | rofi -dmenu)
  #case $selected in
  echo "$selected"
  notify-send "$(supergfxctl -m $selected)"
}

function nvid_smi () {
  local status="$(supergfxctl -g)"
  if [ $status -ne "hybrid" ]; then
    notify-send "GFX status is $status. Operation not permitted."
  else
    kitty --class="__floating" watch -d -n 1 nvidia-smi
  fi
}

function battop_open () {
  kitty --class="__floating" battop
}

function profile_select () {
  local rowsel=0
  local current=$(powerprofilesctl get)
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
  
  chosen="$(echo -e "$qui\n$bal\n$per" | rofi -dmenu -selected-row $rowsel)"
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
}

function main_menu () {
  local gfx_mode_selected="Set supergfx mode"
  local power_mode_selected="Set power profile"
  local rog_cont="Open ROG control center"
  local nvid_stats="Open Nvidia-SMI"
  local bat_stats="Open battop"
  local stac_stats="Open Stacer (will tile)"
  local options="$gfx_mode_selected\n$power_mode_selected\n$rog_cont\n$nvid_stats\n$bat_stats\n$stac_stats"
  local selected=$(echo -e $options | rofi -dmenu )
  case $selected in
    $gfx_mode_selected)
      mode_select
    ;;
    $power_mode_selected)
      profile_select
    ;;
    $rog_cont)
      rog-control-center
    ;;
    $nvid_stats)
      nvid_smi
    ;;
    $bat_stats)
      kitty --class="__floating" battop
    ;;
    $stac_stats)
      stacer
    ;;
  esac
}

main_menu
