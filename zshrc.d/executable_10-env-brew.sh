#! /usr/bin/env bash
# [Homebrew](https://brew.sh/)
# Install
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ "$(uname)" = "Darwin" ]]; then
    BREWCMD=/opt/homebrew/bin/brew
else
    BREWCMD=/home/linuxbrew/.linuxbrew/bin/brew
fi
if [[ -x "$(command -v "$BREWCMD")" ]]; then
    eval "$("$BREWCMD" shellenv)"
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
