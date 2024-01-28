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
