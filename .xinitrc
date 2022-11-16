#!/bin/sh
#[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
if [ "$WAS_I_STARTED_WITH_i3" == "true" ]; then
  exec i3-run-sddm.sh
else
  export GNUPGHOME="$XDG_DATA_HOME"/gnupg
  export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
  export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
  export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
  export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
  export GTK_CSD=0
fi

#. /etc/X11/xinitrc

