#!/bin/bash

getIcon() {
    local percentage=$(cat "/sys/class/power_supply/BAT0/capacity")
    local status=$(cat "/sys/class/power_supply/BAT0/status")

    if [[ "$status" == "Charging" ]]; then
        echo "󰉁"
    else
        echo ""
    fi
}

getColor() {
    local percentage=$(cat "/sys/class/power_supply/BAT0/capacity")

    if [[ $percentage -ge 70 ]]; then
        echo "#50FA7B"
    elif [[ $percentage -ge 30 ]]; then
        echo "#F1FA8C"
    else
        echo "#ee333c"
    fi
}

main() {
    local percentage=$(cat "/sys/class/power_supply/BAT0/capacity")
    local status=$(cat "/sys/class/power_supply/BAT0/status")
    local icon=$(getIcon)
    local color=$(getColor)

    printf '{"percentage": %d, "status": "%s", "icon": "%s", "color": "%s"}' \
        "$percentage" "$status" "$icon" "$color"
}

main