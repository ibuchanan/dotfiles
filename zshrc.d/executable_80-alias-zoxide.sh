#! /usr/bin/env bash
# [zoxide](https://github.com/ajeetdsouza/zoxide)
# zoxide is a smarter cd command, inspired by z and autojump
if [[ -x "$(command -v zoxide)" ]]; then
    eval "$(zoxide init --cmd cd zsh)"
fi
