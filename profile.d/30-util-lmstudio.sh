#! /usr/bin/env bash
# [LM Studio](https://lmstudio.ai/)
# Install
# brew install lm-studio

LMSCMD="$(brew --prefix lm-studio)/bin/lms"
if [[ -x "$(command -v "$LMSCMD")" ]]; then
    PATH="$PATH:$(brew --prefix lm-studio)/bin"
    export PATH
fi
