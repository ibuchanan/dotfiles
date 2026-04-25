#! /usr/bin/env bash
# [Atlassian Forge](https://go.atlassian.com/forge)
# Install
# cd npm-global && npm install
# Or:
# npm install -g @forge/cli
# Shell completions for `forge` are managed by zinit in 91-shell-zinit.sh.

# [Using env vars to login](https://developer.atlassian.com/platform/forge/getting-started/#using-environment-variables-to-login)
# Uncomment and fill in if `forge login` does not work.
# export FORGE_EMAIL=""
# export FORGE_API_TOKEN=""

# [Forge Bootstrap](https://github.com/ibuchanan/forge-bootstrap)
# Utilities for bootstrapping new Node and Atlassian Forge apps
export FORGE_BOOTSTRAP_HOME="$HOME/dev/git/github.com/ibuchanan/forge-bootstrap"
alias forge-bootstrap="mask --maskfile $FORGE_BOOTSTRAP_HOME/maskfile.md"
alias fbs="mask --maskfile $FORGE_BOOTSTRAP_HOME/maskfile.md"

# Atlassian Orbit
# https://hello.atlassian.net/wiki/spaces/Orbit/overview
if [[ -d "$HOME/.orbit/bin" ]]; then
    export PATH="$HOME/.orbit/bin:$PATH"
fi
