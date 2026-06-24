#! /usr/bin/env zsh
# [Zinit](https://github.com/zdharma-continuum/zinit)

if [[ $- == *i* ]]; then
	# Explicitly define Zinit paths so Zsh never has to guess
	export ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"

	# Establish a reliable path to Homebrew Zinit without spawning a slow $(brew --prefix) subshell
	local zinit_path="/opt/homebrew/opt/zinit/zinit.zsh"                    # Apple Silicon default
	[[ ! -f "$zinit_path" ]] && zinit_path="/usr/local/opt/zinit/zinit.zsh" # Intel macOS default

	if [[ -f "$zinit_path" ]]; then
		# Ensure the completions directory Zsh is looking for actually exists
		[[ ! -d "$ZINIT_HOME/completions" ]] && mkdir -p "$ZINIT_HOME/completions"

		source "$zinit_path"
		autoload -Uz _zinit
		((${+_comps})) && _comps[zinit]=_zinit

		# Load a few important annexes, without Turbo
		zinit light-mode for \
			zdharma-continuum/z-a-patch-dl \
			zdharma-continuum/z-a-as-monitor \
			zdharma-continuum/z-a-bin-gem-node

		# Load plugins
		zinit light atuinsh/atuin
		zinit light zsh-users/zsh-syntax-highlighting
		zinit light zsh-users/zsh-completions
		zinit light zsh-users/zsh-autosuggestions
		zinit light trystan2k/zsh-tab-title
		zinit snippet OMZ::plugins/command-not-found

		# CLI completions
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

		zinit ice as"completion" id-as"bun-completion"
		zinit snippet "$HOME/.bun/_bun"

		# Secure compinit by explicitly handling the cache file
		ZSH_COMPDUMP="$HOME/.zcompdump"
		zicompinit
	elif [[ -d $HOME/.oh-my-zsh ]]; then
		source $HOME/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		bindkey "^[[A" history-beginning-search-backward
		bindkey "^[[B" history-beginning-search-forward
	fi
fi
