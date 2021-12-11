#!/bin/sh
export WINIT_UNIX_BACKEND=x11 &
lxsession &
fcitx -d &
ulauncher --hide-window --no-window-shadow &
picom &
feh --bg-scale ~/Pictures/.wallpapers/night.jpg &
