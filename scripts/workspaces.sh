#!/bin/bash
######################################################################
# Dependencies: hyprctl, jq
######################################################################

# Check if a workspace is occupied (has windows)
check_occupied() {
    local workspace=$1
    local window_count=$(hyprctl workspaces | grep "workspace ID $workspace" -A 10 | grep "windows:" | awk '{print $2}')

    if [ "$window_count" -gt 0 ]; then
        echo "occupied"
    fi
}

# Create workspace status yuck code
get_workspaces_yuck() {
    local buffered=""
    local status_class=""
    local icon=""

    # Get workspace information
    hyprctl workspaces | awk '/^workspace/ {print $3}' | while read -r workspace; do
        # Determine current workspace status
        if [ "$workspace" == "$1" ]; then
            status_class="workspace_active"
            icon=""
        else
            occupied=$(check_occupied "$workspace")
            if [ -n "$occupied" ]; then
                status_class="workspace_occupied"
                icon=""
            else
                status_class="workspace_inactive"
                icon=""
            fi
        fi

        buffered+=$'\n'
        buffered+="(label :class '$status_class' :text '$icon')"

        if [ "$workspace" == "$1" ]; then
            echo "$buffered"
        fi
    done
}

# Get active window name
get_activewindow() {
    local windowName=$(hyprctl activewindow | grep "class:" | awk '{print $2}')

    if [ -z "$windowName" ]; then
        echo "inactive"
    else
        echo "$windowName"
    fi
}

# Main script logic
if [ "$1" == "--workspaces_yuck" ]; then
    ewwStructure="box :spacing 20"

    # Get the total number of workspaces
    workspacesNumber=$(hyprctl workspaces | awk '/^workspace/ {print $3}' | tail -n1)
    workspacesStatus=$(get_workspaces_yuck "$workspacesNumber")

    echo "($ewwStructure $workspacesStatus)"
elif [ "$1" == "--activewindow" ]; then
    get_activewindow
fi
