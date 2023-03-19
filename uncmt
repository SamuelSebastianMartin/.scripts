#!/bin/bash

# Uncomment or remove beginning of line in vim
# By default, it strips the first 2 characters
# ┌────────────┐
# │USE :.!uncmt│
# └────────────┘
# Or for multiple lines
# ┌────────────────┐
# │USE :.,.+3!uncmt│
# └────────────────┘
# Alternatively, pass it an integer to remove
# ┌──────────────┐
# │USE :.!uncmt 3│
# └──────────────┘

# Alias to 'uc' in .bashrc

while read -r line; do
    echo "${line:${1:-2}}"
done

# To do:
# 1. check that the characters being removed are not
#    not letters or numbers.
