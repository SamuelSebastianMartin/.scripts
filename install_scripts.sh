#!/bin/bash

################################################
#                                              #
#  install_scripts.sh                          #
#                                              #
#  Install all .sh scripts in the `~/.scripts` #
#  to `~/.local/bin/`                          #
#  And make them executable                    #
#                                              #
#  Only run this ONCE, when setting up         #
#  a new computer                              #
#                                              #
################################################

sourceDir="$HOME/.scripts/" # Where the scripts exist
linkDir="$HOME/.local/bin/" # Directory on $PATH

# Check if the source directory exists
if [ ! -d "$sourceDir" ]; then
    echo "Source directory $sourceDir does not exist."
    exit 1
fi

# Check if the link directory exists
if [ ! -d "$linkDir" ]; then
    echo "Link directory $linkDir does not exist. Please create it before running the script."
    exit 1
fi

# Check if there are any .sh files in the source directory
sh_files=("$sourceDir"*.sh)
if [ -e "${sh_files[0]}" ]; then
    for file in "${sh_files[@]}"; do
        # Create a symlink in the link directory
        ln -s "$file" "$linkDir$(basename "$file" .sh)"
    done
else
    echo "There are no .sh scripts in $sourceDir"
fi

