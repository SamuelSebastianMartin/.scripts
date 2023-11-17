#!/bin/sh

# To set the status bar in dwm suckless windows manager.
# xsetroot -name is the name of the main / background window

# This file shoud be called by (.xinit or .xprofile when used
# with a login manager.)

while true; do
    # Anything to put in the status bar should be
    # put in the $(), below.

    # get battery level
    bat_percent=$( upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -b 5- )
    # get date format
    date_time=$( date +%d/%m/%Y\ %H:%M )

    # set bar
    xsetroot -name "Bat ${bat_percent}   ${date_time}"
    sleep 60
done

