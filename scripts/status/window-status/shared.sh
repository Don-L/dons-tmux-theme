#!/usr/bin/env bash

build_window_format_end_segment() {
    local separator=("$1" "$2" "$3" "$4")
    local terminator=("$5" "$6" "$7" "$8")

    local separator_format=$(build_segment "${separator[@]}")
    local terminator_format=$(build_segment "${terminator[@]}")

    echo "#( \
        current_win=\"#{window_index}\"; \
        total_wins=\$(tmux list-windows | wc -l); \
        if [ \${current_win} -eq \${total_wins} ]; then \
            echo '$terminator_format'; \
        else \
            echo '$separator_format'; \
        fi
    )"
}

