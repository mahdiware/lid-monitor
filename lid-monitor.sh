#!/bin/bash

# Default configuration path
SYSTEM_CONFIG="/etc/lid-monitor/config.json"

# User-specific configuration path
USER_CONFIG="$HOME/.config/lid-monitor/config.json"

# Function to load configuration
load_config() {
    local config_file="$1"
    if [[ -f "$config_file" ]]; then
        jq -r 'to_entries | .[] | "\(.key)=\"\(.value)\""' "$config_file" || { echo "Failed to parse $config_file"; exit 1; }
    fi
}

# Load system-wide configuration
eval "$(load_config "$SYSTEM_CONFIG")"

# Override with user-specific configuration if it exists
eval "$(load_config "$USER_CONFIG")"

# Function to get the current lid state
get_lid_state() {
    grep -q open /proc/acpi/button/lid/LID/state && echo "open" || echo "closed"
}

# Initial state
PREVIOUS_STATE=$(get_lid_state)

while true; do
    CURRENT_STATE=$(get_lid_state)
    if [[ "$CURRENT_STATE" != "$PREVIOUS_STATE" ]]; then
        if [[ "$CURRENT_STATE" == "open" ]]; then
            echo "Lid opened"
            eval "$lid_open_command"
        else
            echo "Lid closed"
            eval "$lid_close_command"
        fi
        PREVIOUS_STATE="$CURRENT_STATE"
    fi
    sleep 1
done
