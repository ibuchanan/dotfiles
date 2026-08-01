#! /usr/bin/env bash
# [Rust](https://www.rust-lang.org/)
# Install
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
CARGO_HOME="$HOME/.cargo"
if [[ -d $CARGO_HOME/bin ]] && [[ ":$PATH:" != *":$CARGO_HOME/bin:"* ]]; then
	export PATH="$PATH:$CARGO_HOME/bin"
fi
