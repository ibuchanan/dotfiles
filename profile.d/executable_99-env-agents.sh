#! /usr/bin/env bash
# Prepending to the path so last location will be first

# Exits if the shell is interactive
[[ $- == *i* ]] && return

# Agent wrapper commands
if [[ -d "$HOME/.agents/bin" ]]; then
	if [[ ":$PATH:" != *":$HOME/.agents/bin:"* ]]; then
		export PATH="$HOME/.agents/bin:$PATH"
	fi
	for file in "$HOME/.agents/bin"/*; do
		if [[ -x "$file" ]]; then
			name=$(basename "$file")
			alias "$name" &>/dev/null && unalias "$name"
		fi
	done
fi

# Agent helper vars
export TURBO_TELEMETRY_DISABLED=1
export VITEST_TELEMETRY_DISABLED=1
