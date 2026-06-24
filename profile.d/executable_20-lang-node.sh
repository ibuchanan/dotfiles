#! /usr/bin/env bash
# [Node.js](https://nodejs.org/)
# export NODE_ENV=development
# Forge doesn't like NODE_ENV

# [fnm](https://fnm.vercel.app/)
# brew install fnm
export FNM_DIR="$HOME/.fnm"
if [[ -x "$(command -v fnm)" ]]; then
	eval "$(fnm env --use-on-cd)"
fi

# [bun](https://bun.com/)
# curl -fsSL https://bun.sh/install | bash
export BUN_INSTALL="$HOME/.bun"
if [[ -d "$BUN_INSTALL" ]]; then
	if [[ ":$PATH:" != *":$BUN_INSTALL/bin:"* ]]; then
		export PATH="$PATH:$BUN_INSTALL/bin"
	fi
fi

alias promptfoo='fnm exec --using=22 -- promptfoo'
