#! /usr/bin/env bash
# [LM Studio](https://lmstudio.ai/)
# Install
# brew install lm-studio

LM_STUDIO_HOME="$HOME/.lmstudio/"
if [[ -x "$(command -v "$LM_STUDIO_HOME/bin/lms")" ]] && [[ ":$PATH:" != *":$LM_STUDIO_HOME/bin:"* ]]; then
	export PATH="$PATH:$LM_STUDIO_HOME/bin"
fi
