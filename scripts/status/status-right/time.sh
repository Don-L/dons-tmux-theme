#!/usr/bin/env bash

build_time() {
    local time_icon=(
        "$status_right_bg"
        "$yellow"
        "nobold"
        "  "
    )

    local time=(
        "$status_right_bg"
        "$status_right_fg",
        "nobold"
        "%H:%M "
    )

    local time_icon_format=$(build_segment "${time_icon[@]}")
    local time_format=$(build_segment "${time[@]}")

    echo "$time_icon_format$time_format"
}

