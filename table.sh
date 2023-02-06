#! /bin/bash
#
# Add a markdown table template for use
# in pandoc
#
#   | 1 | 2 | 3 |
#   |---|---|---|
#   | 1 | 2 | 3 |

COLS=$1
ROWS=$2

function addRow {
    for ((i=0;i<$COLS;i++)); do
        echo -n "| $(( $i+1 )) "
    done
    echo '|'
}

function addDivider {
    for ((i=0;i<$COLS;i++)); do
        echo -n "|:--"
    done
    echo '|'
}

function makeTable {
    echo
    addRow
    addDivider
    for ((j=1;j<$ROWS;j++)); do
        addRow
    done
    echo
}

makeTable
