#!/usr/bin/sh

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK_CSD=0
export i3HOME="$XDG_CONFIG_HOME/i3"

i3
