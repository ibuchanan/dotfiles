# Prompt
GITHUB_USER=ibuchanan
EDITOR="code --wait"

# [Starship](https://starship.rs/)
# brew install starship
export STARSHIP_CONFIG=~/.starship.toml
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
