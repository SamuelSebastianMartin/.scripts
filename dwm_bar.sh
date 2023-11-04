#!/bin/sh

# To set the status bar in dwm suckless windows manager.
# xsetroot -name is the name of the main / background window

# This file shoud be called by (.xinit or .xprofile when used
# with a login manager.)

while true; do
    # Anything to put in the status bar should be
    # put in the $(), below.
    xsetroot -name "$(
    date +%d/%m/%Y\ %H:%M
    )"
    sleep 60
done

