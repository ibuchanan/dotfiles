#! /usr/bin/env bash
# Prepending to the path so last location will be first

# npm-global
# My own approach to better installs than `npm install -g`
NPM_GLOBAL="$HOME/npm-global"
if [[ -d "$NPM_GLOBAL/node_modules/.bin" ]]; then
    export PATH="$NPM_GLOBAL/node_modules/.bin:$PATH"
fi

# Pip --user commands
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Personal commands
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi
