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

	# [Forge Bootstrap](https://github.com/ibuchanan/forge-bootstrap)
	# Utilities for bootstrapping new Node and Atlassian Forge apps
	export FORGE_BOOTSTRAP_HOME="$HOME/dev/git/github.com/ibuchanan/forge-bootstrap"
	# alias expands on use, so single-quote for env vars
	alias forge-bootstrap='mask --maskfile $FORGE_BOOTSTRAP_HOME/maskfile.md'
	alias fbs='mask --maskfile $FORGE_BOOTSTRAP_HOME/maskfile.md'

	# Atlassian Orbit
	# https://hello.atlassian.net/wiki/spaces/Orbit/overview
	if [[ -d "$HOME/.orbit/bin" ]] && [[ ":$PATH:" != *":$HOME/.orbit/bin:"* ]]; then
		export PATH="$HOME/.orbit/bin:$PATH"
	fi

    # Atlassian SSH agent for YubiKey notifications
    # https://hello.atlassian.net/wiki/spaces/cskb/pages/5250745730/Installing+the+Atlassian+SSH+agent
    # https://bitbucket.org/asecurityteam/atlkey/src/main/
    ATLKEYCMD="$HOME/bin/atlkey"
    if [[ -x "$ATLKEYCMD" ]] && [[ "$OSTYPE" == "darwin"* ]] && [ ! -S /tmp/atlkey.sock ]; then
        (
            ~/bin/atlkey &>/dev/null &
            disown
        )
    fi
fi
