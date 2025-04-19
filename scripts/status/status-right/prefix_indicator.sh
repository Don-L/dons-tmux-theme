#!/usr/bin/env bash

build_prefix_indicator() {
    local prefix_indicator_terminator_inactive=(
        "$prefix_indicator_initialiser_bg" 
        "$prefix_indicator_initialiser_fg_inactive"
        ""
        ""
    )

    local prefix_indicator_terminator_active=(
        "$prefix_indicator_initialiser_bg" 
        "$prefix_indicator_initialiser_fg_active"
        ""
        ""
    )

    local prefix_indicator_inactive=(
        "$prefix_indicator_bg_inactive"
        "$status_right_bg"
        ""
        "   󰙀    "
    )

    local prefix_indicator_active=(
        "$prefix_indicator_bg_active"
        "$status_right_bg"
        ""
        "   󰙀    "
    )

    local terminator_inactive_segment=$(build_segment "${prefix_indicator_terminator_inactive[@]}")
    local indicator_inactive_segment=$(build_segment "${prefix_indicator_inactive[@]}")
    local terminator_active_segment=$(build_segment "${prefix_indicator_terminator_active[@]}")
    local indicator_active_segment=$(build_segment "${prefix_indicator_active[@]}")

    echo "#( \
        if [ \"#{client_prefix}\" -eq 1 ]; then \
            echo '$terminator_active_segment$indicator_active_segment'; \
        else \
            echo '$terminator_inactive_segment$indicator_inactive_segment'; \
        fi
    )"
}

