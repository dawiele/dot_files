#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#exec ck-launch-session gnome-session
# exec startkde
xsetroot -solid black
#exec ck-launch-session ratpoison 
#exec ck-launch-session startxfce4
#exec ck-launch-session xfce4-power-manager startlxde
#exec ck-launch-session openbox-session 
#...or the Window Manager of your choice
exec ck-launch-session xmonad | xmobar | sh ~/2.sh 
