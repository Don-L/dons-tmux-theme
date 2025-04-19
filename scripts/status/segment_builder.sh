#!/usr/bin/env bash

build_segment_content() {
    local content="$1"

    if [ "$content" = "$DIRECTORY_NAME" ]; then
        content="#(pwd=\"#{pane_current_path}\"; echo \${pwd####*/})"
    fi

    if [ "$content" = "$BATTERY_CHARGE" ]; then
        content="#(pmset -g batt | awk '/[0-9]+%/{gsub(\";\", \"\"); print \"\"\$3}') "
    fi

    echo "$content"
}

build_segment_style() {
    local style="$1"

    if [ -n "$style" ]; then
        style=",$style"
    fi

    echo "$style"
}

build_segment() {
    local bg="$1"
    local fg="$2"
    local style="$3"
    local content="$4"

    style=$(build_segment_style "$style")
    content=$(build_segment_content "$content")

    echo "#[bg=$bg,fg=$fg$style]$content"
}

