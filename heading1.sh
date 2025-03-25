#!/bin/bash

# ┌───────────────────────────────────────┐
# │        ▌ ▌        ▌▗       ▗▌         │
# │        ▙▄▌▞▀▖▝▀▖▞▀▌▄ ▛▀▖▞▀▌ ▌         │
# │        ▌ ▌▛▀ ▞▀▌▌ ▌▐ ▌ ▌▚▄▌ ▌         │
# │        ▘ ▘▝▀▘▝▀▘▝▀▘▀▘▘ ▘▗▄▘▝▀         │
# └───────────────────────────────────────┘

# Add a large bordered heading banner to document (vim)
# Default max-width= 54. Add new value as an
# argument to override

# ┌───────────────┐
# │USE: .!heading1│
# └───────────────┘

# ┌──────────────────┐
# │USE: .!heading1 30│
# └──────────────────┘

declare -i Width=${1:-25} # default if no argument passed

main(){
    while read -r text; do
        checkLength
        printHeading
    done
}

checkLength(){
    if [[ ${#text} -gt ${Width} ]]; then
        echo ">> More than $Width characters. Pass argument to override"
        echo ">> e.g '${0##*/} 64'"
        exit
    fi
}

printHeading(){
    local -i padNum=$(( (Width-${#text})/2 ))
    pad=$(printf "%*s%s" $padNum '')
    # * means to get the width from the argument $padNum.
    # Then it prints an empty string in a field with that width
    toilet -f smblock -F border "$pad${text}$pad"
}

main

# To do:
# 1. Set a fixed witdth
