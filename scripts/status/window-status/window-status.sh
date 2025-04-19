#!/usr/bin/env bash
tmux set -g window-status-separator ""

window_index="#I"
window_name="#W"
window_status_bg="$dark_grey"
window_status_accent="$blue"
window_status_fg="$white"
window_status_separator_bg="$dark_grey"
window_status_separator_fg="$white"
window_status_index_fg="$blue"
window_status_right_terminal_bg="default"
window_status_right_terminal_fg="$dark_grey"
window_status_info_1="  $window_index "
window_status_info_1_bold_nobold="bold"
window_status_info_2_bold_nobold="nobold"
window_status_terminator_bg="$status_bg"
window_status_terminator="██"
window_status_separator="  "

build_window_format() {
    local info_1=(
        "$window_status_bg"
        "$window_status_accent"
        "bold"
        "$window_status_info_1"
    )

    local window_label="$window_name"

    if [ "$(tmux show-option -gqv "@dons_tmux_use_directory")" = "on" ]; then
        window_label="$DIRECTORY_NAME"
    fi

    local info_2=(
        "$window_status_bg"
        "$window_status_fg"
        "nobold"
        "$window_label"
    )

    local separator=(
        "$window_status_bg"
        "$window_status_fg"
        ""
        "$window_status_separator"
    )

    local terminator=(
        "$status_bg"
        "$window_status_bg"
        ""
        "$window_status_terminator"
    )

    local info_segment_1=$(build_segment "${info_1[@]}")
    local info_segment_2=$(build_segment "${info_2[@]}")
    local end_segment=$(build_window_format_end_segment "${separator[@]}" "${terminator[@]}")

    echo "$info_segment_1$info_segment_2$end_segment"
}

