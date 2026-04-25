#! /usr/bin/env zsh
# [Zinit](https://github.com/zdharma-continuum/zinit)
# Install
# brew install zinit
if [[ -f "$(brew --prefix)/opt/zinit/zinit.zsh" ]]; then
    source "$(brew --prefix)/opt/zinit/zinit.zsh"
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
    zinit light atuinsh/atuin
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-autosuggestions
    zinit light trystan2k/zsh-tab-title
    zinit snippet OMZ::plugins/command-not-found

    # CLI completions generated on install / regenerated on `zinit update`
    zinit ice as"completion" id-as"turbo-completion" has"turbo" \
        atclone"turbo completion zsh > _turbo; zinit creinstall -q turbo-completion" \
        atpull"%atclone" run-atpull
    zinit light zdharma-continuum/null

    zinit ice as"completion" id-as"opencode-completion" has"opencode" \
        atclone"opencode completion zsh > _opencode; zinit creinstall -q opencode-completion" \
        atpull"%atclone" run-atpull
    zinit light zdharma-continuum/null

    zinit ice as"completion" id-as"forge-completion" has"forge" \
        atclone'{ print "#compdef forge"; forge --completion; } > _forge; zinit creinstall -q forge-completion' \
        atpull"%atclone" run-atpull
    zinit light zdharma-continuum/null

    zinit ice as"completion" id-as"zrok-completion" has"zrok" \
        atclone"zrok completion zsh > _zrok; zinit creinstall -q zrok-completion" \
        atpull"%atclone" run-atpull
    zinit light zdharma-continuum/null

    # Initialize the completion system after all completions are in place
    zicompinit
elif [[ -d $HOME/.oh-my-zsh ]]; then
    # Autosuggestions
    source $HOME/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey "^[[A" history-beginning-search-backward
    bindkey "^[[B" history-beginning-search-forward
fi
