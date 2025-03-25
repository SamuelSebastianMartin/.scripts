#! /bin/bash

# Search duckduckgo.com in lynx browser.
# Start date: Sat 11 Feb 01:29:12 GMT 2023
#
# Alias to '?' for searhes.

# Set URL of search engine
BASE_URL='https://lite.duckduckgo.com/lite/'

# Begin search string
SRCH='?q='

# Append arguments to search string
for arg in "${@}"; do
    SRCH+="${arg}+";
done

# Remove trailing '+' from search string
SRCH=${SRCH::-1}

URL="${BASE_URL}${SRCH}"

lynx "${URL}"
