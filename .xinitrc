#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
#/usr/bin/VBoxClient-all

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
# exec gnome-session
exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

#xsetroot -solid black&
#xcompmgr -c -f -D 5&
#exec /usr/bin/ratpoison
#xsetroot -cursor_name left_ptr
#exec qtile
#exec wmii
