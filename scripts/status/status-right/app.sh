#!/usr/bin/env bash

make_icon_segment_params() {
    local icon="$1"
    echo "$status_right_bg" "$green" "nobold" "$icon"
}

build_icon() {
    local default_icon_format=$(build_segment $(make_icon_segment_params ""))
    local nvim_icon_format=$(build_segment $(make_icon_segment_params ""))
    local vim_icon_format=$(build_segment $(make_icon_segment_params ""))
    local ssh_icon_format=$(build_segment $(make_icon_segment_params ""))
    local node_icon_format=$(build_segment $(make_icon_segment_params ""))
    local git_icon_format=$(build_segment $(make_icon_segment_params ""))
    local ngrok_icon_format=$(build_segment $(make_icon_segment_params "󰴤"))
    local python_icon_format=$(build_segment $(make_icon_segment_params ""))
    local php_icon_format=$(build_segment $(make_icon_segment_params ""))
    local db_icon_format=$(build_segment $(make_icon_segment_params ""))

    echo "#( \
        app=\"#{pane_current_command}\"; \
        if [ \${app} = \"nvim\" ]; then \
            echo '$nvim_icon_format'; \
        elif [ \${app} = \"vim\" ]; then \
            echo '$vim_icon_format'; \
        elif [ \${app} = \"ssh\" ]; then \
            echo '$ssh_icon_format'; \
        elif [ \${app} = \"node\" ]; then \
            echo '$node_icon_format'; \
        elif [ \${app} = \"git\" ]; then \
            echo '$git_icon_format'; \
        elif [ \${app} = \"ngrok\" ]; then \
            echo '$ngrok_icon_format'; \
        elif [ \${app} = \"python\" ]; then \
            echo '$python_icon_format'; \
        elif [ \${app} = \"php\" ]; then \
            echo '$php_icon_format'; \
        elif [ \${app} = \"mysql\" ]; then \
            echo '$db_icon_format'; \
        elif [ \${app} = \"psql\" ]; then \
            echo '$db_icon_format'; \
        else \
            echo '$default_icon_format'; \
        fi
    )"

}

build_app_format() {
    local name=(
        "$status_right_bg"
        "$status_right_fg"
        "nobold"
        "#{pane_current_command} "
    )

    local icon_format=$(build_icon)
    local name_format=$(build_segment "${name[@]}")

    echo "$icon_format  $name_format"
}

