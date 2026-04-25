#! /usr/bin/env bash
# [Node.js](https://nodejs.org/)
# export NODE_ENV=development
# Forge doesn't like NODE_ENV

# [fnm](https://fnm.vercel.app/)
# brew install fnm
export FNM_DIR="$HOME/.fnm"
if [[ -d "$FNM_DIR" ]] && [[ -x "$(command -v fnm)" ]]; then
    eval "$(fnm env --use-on-cd)"
fi

# [bun](https://bun.com/)
# curl -fsSL https://bun.sh/install | bash
export BUN_INSTALL="$HOME/.bun"
if [[ -d "$BUN_INSTALL" ]]; then
    export PATH="$BUN_INSTALL/bin:$PATH"
    source "$BUN_INSTALL/_bun"
fi

if [[ -x "$(command -v biome)" ]]; then
    biome --print-shell-completion zsh
fi
alias knip='bunx knip'
alias sort-package-json='bunx sort-package-json'
