# brew
# Add & remove java versions as brew upgrades them
# Assumes the openjdk (aliased from `java` in brew)

DIR="$(cd "$(dirname "$0")" && pwd)"
source $DIR/common.sh

if ! [[ "$PROMPT_COMMAND" =~ _jenv_brew_hook ]]; then
    PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi

#echo "configure export plugin for ZSH"
function install_hook {
  emulate -LR zsh
  typeset -ag precmd_functions
  if [[ -z $precmd_functions[(r)_jenv_export_hook] ]]; then
        precmd_functions+=_jenv_export_hook;
  fi
}
install_hook

_jenv_brew_hook