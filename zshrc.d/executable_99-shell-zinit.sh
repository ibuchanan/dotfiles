#! /usr/bin/env zsh
# [Zinit](https://github.com/zdharma-continuum/zinit)
# Install
# brew install zinit
if [[ -f "$(brew --prefix)/opt/zinit/zinit.zsh" ]]; then
    source "$(brew --prefix)/opt/zinit/zinit.zsh"
    autoload -Uz compinit && compinit
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    # Load a few important annexes, without Turbo
    # (this is currently required for annexes)
    zinit light-mode for \
        zdharma-continuum/z-a-patch-dl \
        zdharma-continuum/z-a-as-monitor \
        zdharma-continuum/z-a-bin-gem-node

    ### End of Zinit's installer chunk

    # Load plugins
    zinit load zsh-users/zsh-syntax-highlighting
    zinit load zsh-users/zsh-completions
    zinit load zsh-users/zsh-autosuggestions
    zinit snippet OMZ::plugins/command-not-found
fi
