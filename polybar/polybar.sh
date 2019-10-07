#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the proceses have been shutdown
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Launch Polybar, using default config ~/.config/polybar/config
polybar uptop &
#symlink spotify config
ln -sf /tmp/polybar_mqueue.$! /tmp/ipc-bottom
sh $HOME/scripts/spotify/launchlistener.sh
echo message >/tmp/ipc-bottom
