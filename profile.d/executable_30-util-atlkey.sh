#! /usr/bin/env bash
# Atlassian SSH agent for YubiKey notifications
# https://hello.atlassian.net/wiki/spaces/cskb/pages/5250745730/Installing+the+Atlassian+SSH+agent
# https://bitbucket.org/asecurityteam/atlkey/src/main/
if [[ "$OSTYPE" == "darwin"* ]] && [ ! -S /tmp/atlkey.sock ]; then
    (
        ~/bin/atlkey &>/dev/null &
        disown
    )
fi
