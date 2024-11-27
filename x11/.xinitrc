#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

setxkbmap -layout "us,ua" -option "grp:caps_toggle,grp_led:scroll"
exec $HOME/src/dwm/dwm
# exec openbox-session

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
