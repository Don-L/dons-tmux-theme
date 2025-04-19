#!/usr/bin/env bash

source "${PLUGIN_DIR}/scripts/status/status-right/time.sh"
source "${PLUGIN_DIR}/scripts/status/status-right/battery.sh"
source "${PLUGIN_DIR}/scripts/status/status-right/prefix_indicator.sh"
source "${PLUGIN_DIR}/scripts/status/status-right/app.sh"

status_bg="default"
status_right_bg="$dark_grey"
status_right_fg="$white"
prefix_indicator_bg_inactive="$blue"
prefix_indicator_bg_active="$red"
prefix_indicator_initialiser_bg="$status_right_bg"
prefix_indicator_initialiser_fg_inactive="$prefix_indicator_bg_inactive"
prefix_indicator_initialiser_fg_active="$prefix_indicator_bg_active"

build_status_right() {
    local terminator=(
        "$status_bg"
        "$status_right_bg"
        ""
        "█"
    )

    local separator=(
        "$status_right_bg"
        "$white"
        "nobold"
        " "
    )

    local terminator_format=$(build_segment "${terminator[@]}")
    local separator_format=$(build_segment "${separator[@]}")

    local app_format=""
    local battery_format=""
    local battery_separator=""
    local time_separator=""

    if [ "$(tmux show-option -gqv "@dons_tmux_show_app")" = "on" ]; then
        app_format=$(build_app_format)
    fi

    if [ "$(tmux show-option -gqv "@dons_tmux_show_battery")" = "on" ]; then
        battery_format=$(build_battery_format)
    fi

    if [ -n "$app_format" ] && [ -n "$battery_format" ]; then
        battery_separator="$separator_format"
    fi

    if [ -n "$app_format" ] || [ -n "$battery_format" ]; then
        time_separator="$separator_format"
    fi

    local time_format=$(build_time)
    local prefix_indicator=$(build_prefix_indicator)

    echo "$terminator_format$app_format$battery_separator$battery_format$time_separator$time_format$prefix_indicator"
}

build_status_right_old() {
    local terminator=(
        "$status_bg"
        "$status_right_bg"
        ""
        "█"
    )

    local separator=(
        "$status_right_bg"
        "$white"
        "nobold"
        ""
    )

    local terminator_format=$(build_segment "${terminator[@]}")
    local separator_format=$(build_segment "${separator[@]}")

    local app_format=""

    if [ "$(tmux show-option -gqv "@dons_tmux_show_app")" = "on" ]; then
        app_format=$(build_app_format)
    fi

    local battery_format=""

    if [ "$(tmux show-option -gqv "@dons_tmux_show_battery")" = "on" ]; then
        battery_format=$(build_battery_format)
        battery_section="$separator_format$battery_format"
    fi

    local time_format=$(build_time)
    local prefix_indicator=$(build_prefix_indicator)

    echo "$terminator_format$app_format$battery_section$separator_format$time_format$prefix_indicator"
}

