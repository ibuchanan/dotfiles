#! /usr/bin/env bash
# Prompt
export GITHUB_USER=ibuchanan
export EDITOR="code --wait"

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.

# [Starship](https://starship.rs/)
# brew install starship
export STARSHIP_CONFIG=$HOME/.starship.toml
if [[ -x "$(command -v starship)" ]]; then
    eval "$(starship init zsh)"
fi

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

# [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
# display fastfetch on terminal start for context
if [[ -x "$(command -v fastfetch)" ]]; then
    fastfetch
fi
