# [Ruby](https://www.ruby-lang.org/)

export RBENV_HOME="$HOME/.rbenv"
if [[ -d "$RBENV_HOME" ]]; then
	export PATH="$RBENV_HOME/bin:$PATH"
	eval "$(rbenv init -)"
fi
