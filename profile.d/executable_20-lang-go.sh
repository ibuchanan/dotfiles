#! /usr/bin/env bash
# [Go](https://go.dev/)
GO_HOME="$HOME/go"
if [[ -d $GO_HOME ]]; then
	if [[ ":$PATH:" != *":$GO_HOME/bin:"* ]]; then
		export PATH="$PATH:$GO_HOME/bin"
	fi
fi
