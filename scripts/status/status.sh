#!/usr/bin/env bash

status_bg="default"

DIRECTORY_NAME="DIRECTORY_NAME"
BATTERY_CHARGE="BATTERY_CHARGE"

tmux set -g status-left ''
tmux set -g status-bg "$status_bg"

source "${PLUGIN_DIR}/scripts/status/segment_builder.sh"
source "${PLUGIN_DIR}/scripts/status/window-status/window-status.sh"
source "${PLUGIN_DIR}/scripts/status/status-right/status-right.sh"
source "${PLUGIN_DIR}/scripts/status/window-status/shared.sh"
source "${PLUGIN_DIR}/scripts/status/window-status/window-status.sh"
source "${PLUGIN_DIR}/scripts/status/window-status/window-status-current.sh"

tmux set -g status-right "$(build_status_right)"
tmux set -g window-status-format "$(build_window_format)"
tmux set -g window-status-current-format "$(build_window_current_format)"

