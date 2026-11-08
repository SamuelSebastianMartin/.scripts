#!/usr/bin/env bash

sound=/usr/share/sounds/freedesktop/stereo/complete.oga

notify() {
    printf '%s\n' "$1"
}


alert() {
    notify "$1"
    paplay "$sound"
}

run_timer() {
    local label=$1
    local total=$2
    local elapsed=0
    local remaining

    echo "$label started. Press Enter for a time-remaining update."

    while (( elapsed < total )); do
        if read -r -t 1 _; then
            remaining=$((total - elapsed))
            notify "$label: $(format_time "$remaining") remaining."
        else
            ((elapsed++))
            remaining=$((total - elapsed))

            if (( remaining > 0 )); then
                if (( remaining <= 300 )); then
                    # Final 5 minutes: update every minute.
                    if (( remaining % 60 == 0 )); then
                        notify "$label: $(format_time "$remaining") remaining."
                    fi
                elif (( remaining % 300 == 0 )); then
                    # Before the final 5 minutes: update every 5 minutes.
                    notify "$label: $(format_time "$remaining") remaining."
                fi
            fi
        fi
    done
}

format_time() {
    local seconds=$1
    printf '%dm' "$((seconds / 60))"
    if (( seconds % 60 != 0 )); then
        printf ' %ds' "$((seconds % 60))"
    fi
}

for cycle in 1 2; do
    echo "Cycle $cycle of 2"
    run_timer "Work" 1500
    alert "Work finished. Take a 5-minute break."

    run_timer "Break" 300
    alert "Break finished."
done

echo "Pomodoro complete."

