#! /usr/bin/env bash
# [Atlassian Forge](https://go.atlassian.com/forge)
# Install
# cd npm-global && npm install
# Or:
# npm install -g @forge/cli
# Shell completions for `forge` are managed by zinit in 91-shell-zinit.sh.

if [[ $- == *i* ]]; then
	# [Using env vars to login](https://developer.atlassian.com/platform/forge/getting-started/#using-environment-variables-to-login)
	# Uncomment and fill in if `forge login` does not work.
	# export FORGE_EMAIL=""
	# export FORGE_API_TOKEN=""

	# Atlassian Orbit
	# https://hello.atlassian.net/wiki/spaces/Orbit/overview
	if [[ -d "$HOME/.orbit/bin" ]] && [[ ":$PATH:" != *":$HOME/.orbit/bin:"* ]]; then
		export PATH="$HOME/.orbit/bin:$PATH"
	fi

fi
