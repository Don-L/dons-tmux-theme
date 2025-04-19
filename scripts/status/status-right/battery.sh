#!/usr/bin/env bash

build_battery_format() {
    local icon=(
        "$status_right_bg"
        "$red"
        "nobold"
        "󱐌 "
    )

    local charge=(
        "$status_right_bg"
        "$status_right_fg",
        "nobold"
        "BATTERY_CHARGE"
    )

    local icon_segment=$(build_segment "${icon[@]}")
    local charge_segment=$(build_segment "${charge[@]}")

    echo "$icon_segment$charge_segment"
}

