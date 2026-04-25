#! /usr/bin/env bash
# Prepending to the path so last location will be first

# Python commands from:
# pip --user
# uv python install --default
# uv tools install ...
if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
    export PATH
    if [[ -f "$HOME/.local/bin/env" ]]; then
        . "$HOME/.local/bin/env"
    fi
fi

# Personal commands
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi
