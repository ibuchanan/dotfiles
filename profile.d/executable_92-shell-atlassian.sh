#! /usr/bin/env bash
# [Atlassian Forge](https://go.atlassian.com/forge)
# Install
# cd npm-global && npm install
# Or:
# npm install -g @forge/cli
if [[ -x "$(command -v forge)" ]]; then
    #. <(forge --completion)
    eval "$(forge --completion)"
fi
if [[ -x "$(command -v acli)" ]]; then
    acli completion zsh > "$(brew --prefix)/share/zsh/site-functions/_acli"
fi

export FORGE_BOOTSTRAP_HOME="$HOME/dev/git/github.com/ibuchanan/forge-bootstrap"
alias forge-bootstrap="mask --maskfile $FORGE_BOOTSTRAP_HOME/maskfile.md"
