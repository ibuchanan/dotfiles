#! /usr/bin/env bash
# [Eza](https://eza.rocks/)
# eza replaces built in ls
if [[ -x "$(command -v eza)" ]]; then
    alias ls='eza -alF --color=always --sort=size | grep -v /'
    alias ll='eza -al --group-directories-first'
    alias ld='eza -lD'
    alias lf='eza -lF --color=always | grep -v /'
    alias lh='eza -dl .* --group-directories-first'
    alias lt='eza -al --sort=modified'
fi
