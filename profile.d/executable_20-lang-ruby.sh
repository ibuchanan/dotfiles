#! /usr/bin/env bash
# [Ruby](https://www.ruby-lang.org/)

export RBENV_HOME="$HOME/.rbenv"
if [[ -d "$RBENV_HOME" ]]; then
	if [[ ":$PATH:" != *":$RBENV_HOME/bin:"* ]]; then
		export PATH="$RBENV_HOME/bin:$PATH"
	fi
	eval "$(rbenv init -)"
fi
