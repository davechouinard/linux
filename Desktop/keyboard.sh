#!/bin/bash
on="$HOME/Pictures/keyboard-on.ico"
off="$HOME/Pictures/keyboard-off.png"
state_file="$HOME/.keyboard" 
# use 'xinput list' to find the ID of the 'AT Translated Set 2 keyboard' device
id=11

if [ ! -f $state_file ];
    then
        echo "Creating state file"
        echo "enabled" > $state_file
        state="enabled"
    else
        read -r state< $state_file
        echo "keyboard is : $state"
fi

if [ $state = "disabled" ];
    then
        notify-send -i $on "Enabling keyboard..." \ "ON - Keyboard connected !";
        echo "enable keyboard..."
        xinput enable $id
        echo "enabled" > $state_file
    elif [ $state = "enabled" ]; then
        notify-send -i $off "Disabling Keyboard" \ "OFF - Keyboard disconnected";
        echo "disable keyboard"
        xinput disable $id
        echo 'disabled' > $state_file
fi
