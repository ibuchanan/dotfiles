# brew
# Add & remove java versions as brew upgrades them
# Assumes the openjdk (aliased from `java` in brew)

DIR="$(cd "$(dirname "$0")" && pwd)"
source "$DIR/common.sh"

if ! [[ "$PROMPT_COMMAND" =~ _jenv_brew_hook ]]; then
    PROMPT_COMMAND="_jenv_export_hook;$PROMPT_COMMAND";
fi

_jenv_brew_hook