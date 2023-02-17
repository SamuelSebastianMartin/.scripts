#!/bin/bash
# Find Directoris: findd
# lists directories in PWD to given depth (default=1)

# Stop if *anyting* goes wrong
set -e

# Define colours for printf output
blue=$'\033[34;1m' # blue
color_end=$'\033[0m'

# Set depth to first argument, or 1 if none is given
depth=${1:-1}

# ACTUAL COMMAND
find . -maxdepth ${depth} -type d

# Usage reminder if no arguments passed
if [[ ${#} -lt 1 ]]; then
    printf "%s HINT: %s 2 %s (for depth of 2) \n" "${blue}" "$(basename "${0}")" "${color_end}"
fi
