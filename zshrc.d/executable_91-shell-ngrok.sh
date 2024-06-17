#! /usr/bin/env bash
# [ngrok](https://ngrok.com/)
# Install
# brew install ngrok
if [[ -x "$(command -v ngrok)" ]]; then
    eval "$(ngrok completion)"
fi
