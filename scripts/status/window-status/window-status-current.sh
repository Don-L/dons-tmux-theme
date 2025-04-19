#!/usr/bin/env bash

window_name="#W"
window_status_current_bg="$blue"
window_status_current_fg="$dark_grey"
window_status_current_info_1=" $window_index "
window_status_current_first_initialiser="█"
window_status_current_later_initialiser=""
window_status_current_separator="██"

build_window_current_format_start_segment() {
    local first_initialiser=(
        "$window_status_current_bg"
        "$window_status_current_bg"
        "bold"
        "$window_status_current_first_initialiser"
    )

    local later_initialiser=(
        "$window_status_current_bg"
        "$window_status_current_fg"
        ""
        "$window_status_current_later_initialiser"
    )

    local first_initialiser_format=$(build_segment "${first_initialiser[@]}")
    local later_initialiser_format=$(build_segment "${later_initialiser[@]}")

    echo "#( \
        current_win=\"#{window_index}\"; \
        if [ \${current_win} -eq 1 ]; then \
            echo '$first_initialiser_format'; \
        else \
            echo '$later_initialiser_format'; \
        fi
    )"
}

build_window_current_format() {
    local info_1=(
        "$window_status_current_bg"
        "$window_status_current_fg"
        "bold"
        "$window_status_current_info_1"
    )

    local window_label="$window_name"

    if [ "$(tmux show-option -gqv "@dons_tmux_use_directory")" = "on" ]; then
        window_label="$DIRECTORY_NAME"
    fi

    local info_2=(
        "$window_status_current_bg"
        "$window_status_current_fg"
        "bold"
        "$window_label"
    )

    local separator=(
        "$window_status_current_fg"
        "$window_status_current_bg"
        ""
        "$window_status_current_separator"
    )

    local terminator=(
        "$status_bg"
        "$window_status_current_bg"
        ""
        "$window_status_terminator"
    )

    local initialiser=$(build_window_current_format_start_segment)
    local info_segment_1=$(build_segment "${info_1[@]}")
    local info_segment_2=$(build_segment "${info_2[@]}")
    local end_segment=$(build_window_format_end_segment "${separator[@]}" "${terminator[@]}")

    echo "$initialiser$info_segment_1$info_segment_2$end_segment"
}

