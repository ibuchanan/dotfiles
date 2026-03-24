#! /usr/bin/env bash
# [LM Studio](https://lmstudio.ai/)
# Install
# brew install lm-studio

LMSHOME="$HOME/.lmstudio/"
if [[ -x "$(command -v "$LMSHOME/bin/lms")" ]]; then
    PATH="$PATH:$LMSHOME/bin"
    export PATH
fi
