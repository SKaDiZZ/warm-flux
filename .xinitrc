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

# Turn off Beep sounds
xset -b

# Set keyboard
setxkbmap hr 

# Nitrogen
nitrogen --restore &

# Start thunar daemon
thunar --daemon &

# Clipboard manager
clipit &

# VolWheel
volwheel &

# start WM
# exec gnome-session
# exec startkde
# exec startxfce4
# exec fluxbox

fluxbox &
fbpid=$!

sleep 1
{
   # Start compositing
	compton -cC -fF &
   # Start conky
	conky &

} &
 
wait $fbpid
