#!/usr/bin/env bash

# Script to check if the active window is in fullscreen mode in Hyprland
# and set key bindings if true.

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it to parse JSON output."
    exit 1
fi

# Get active window information
active_window=$(hyprctl activewindow -j)

# Check if hyprctl command was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to retrieve active window information with hyprctl."
    exit 1
fi

# Extract fullscreen status (0 = not fullscreen, 1 = fullscreen, 2 = maximized)
fullscreen_status=$(echo "$active_window" | jq -r '.fullscreen')

# Check if the active window is in fullscreen mode
if [ "$fullscreen_status" -ne 0 ]; then
    echo "Active window is in fullscreen mode. Setting key bindings..."

    # Set key bindings using hyprctl
    hyprctl keyword unbind SUPER,J
    hyprctl keyword unbind SUPER,K
    hyprctl keyword bind SUPER,J,layoutmsg,cyclenext
    hyprctl keyword bind SUPER,K,layoutmsg,cycleprev

    # Optional: Notify user of binding changes (requires notify-send)
    if command -v notify-send &> /dev/null; then
        notify-send -u low "Hyprland Key Bindings" "Set key bindings for fullscreen window."
    fi
else
    echo "Active window is not in fullscreen mode. No key bindings set."
    hyprctl keyword unbind SUPER,J
    hyprctl keyword unbind SUPER,K
    hyprctl keyword bind SUPER,J,movefocus,d
    hyprctl keyword bind SUPER,K,movefocus, u

    # Optional: Notify user of binding changes (requires notify-send)
    if command -v notify-send &> /dev/null; then
        notify-send -u low "Hyprland Key Bindings" "Set key bindings for non-fullscreen window."
    fi
fi

exit 0
