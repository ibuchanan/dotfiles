#! /usr/bin/env bash
# [Rust](https://www.rust-lang.org/)
# Install
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [[ -d $HOME/.cargo/bin ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
