# Personal commands
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi

# Pip --user commands
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# npm-global
# My own approach to better installs than `npm install -g`
NPM_GLOBAL="$HOME/npm-global"
if [[ -d "$NPM_GLOBAL/node_modules/.bin" ]]; then
    export PATH="$NPM_GLOBAL/node_modules/.bin:$PATH"
fi
