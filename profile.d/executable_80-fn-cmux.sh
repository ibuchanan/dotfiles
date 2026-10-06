#! /usr/bin/env bash
# [cmux](https://cmux.com/)
# Free and open source native macOS terminal built on Ghostty for working with AI coding agents
if [[ $- == *i* ]] && [[ -x "$(command -v cmux)" ]]; then
    cmux-forge() {
        local dir="${1:-.}"
        dir="$(cd "$dir" && pwd)"
        cmux workspace create \
            --name "$(basename "$dir")" \
            --cwd "$dir" \
            --layout '{"direction":"horizontal","split":0.5,"children":[{"pane":{"surfaces":[{"type":"terminal"}]}},{"pane":{"surfaces":[{"type":"terminal"}]}}]}' \
            --focus true
    }

    # At this shell's first prompt, signal shell-ready:<surface UUID> so scripts know
    # it is safe to send input (see _cmux_run_when_ready). cmux holds the signal until
    # someone waits for it, so it does not matter which side gets there first.
    if [[ -n "${ZSH_VERSION:-}" && -n "${CMUX_SURFACE_ID:-}" ]]; then
        autoload -Uz add-zsh-hook
        _cmux_signal_ready() {
            add-zsh-hook -d precmd _cmux_signal_ready
            (cmux wait-for -S "shell-ready:$CMUX_SURFACE_ID" >/dev/null 2>&1 &)
        }
        add-zsh-hook precmd _cmux_signal_ready
    fi

    # Create a terminal tab and name it <title>.
    # Usage: _cmux_new_tab <title> <new-split|new-surface> [args...]
    # Prints cmux's JSON result, which includes pane_ref, surface_ref, and surface_id.
    _cmux_new_tab() {
        local title=$1 result surface
        shift
        result=$(cmux --json --id-format both "$@" --workspace "$CMUX_WORKSPACE_ID" 2>&1) &&
            surface=$(jq -er '.surface_ref' <<< "$result") || {
            printf 'cmux: %s for %s failed: %s\n' "$1" "$title" "$result" >&2
            return 1
        }
        cmux rename-tab --workspace "$CMUX_WORKSPACE_ID" --surface "$surface" -- "$title" >/dev/null || {
            printf 'cmux: failed to name %s as %s\n' "$surface" "$title" >&2
            return 1
        }
        printf '%s\n' "$result"
    }

    # Run <command> in <dir> on a new tab once its shell shows its first prompt.
    # Input typed during shell startup is discarded, so `--command` is unreliable here.
    # Usage: _cmux_run_when_ready <cmux JSON result from _cmux_new_tab> <dir> <command>
    _cmux_run_when_ready() {
        local surface
        surface=$(jq -er '.surface_id' <<< "$1") || return
        cmux wait-for "shell-ready:$surface" --timeout 30 >/dev/null ||
            printf 'cmux: %s never signalled ready; sending anyway\n' "$surface" >&2
        cmux send --workspace "$CMUX_WORKSPACE_ID" --surface "$surface" -- "cd -- $(printf '%q' "$2") && $3\n" >/dev/null || {
            printf 'cmux: failed to send command to %s\n' "$surface" >&2
            return 1
        }
    }

    # Above the left pane, open a pane with remote:start, tunnel:start, and forge tabs.
    cmux-remote() {
        if [[ -z "${CMUX_WORKSPACE_ID:-}" ]]; then
            printf '%s\n' 'cmux-remote: run this inside a cmux workspace' >&2
            return 1
        fi

        local dir=$PWD left_surface pane remote tunnel forge
        left_surface=$(cmux tree --workspace "$CMUX_WORKSPACE_ID" --json |
            jq -er '[.windows[].workspaces[].panes | sort_by(.index) | .[0].surfaces[0].ref][0] // empty') || {
            printf '%s\n' 'cmux-remote: could not identify the left pane' >&2
            return 1
        }

        # Create every tab first so their shells start in parallel.
        remote=$(_cmux_new_tab remote:start new-split up --surface "$left_surface") || return
        pane=$(jq -r '.pane_ref' <<< "$remote")
        tunnel=$(_cmux_new_tab tunnel:start new-surface --pane "$pane") || return
        forge=$(_cmux_new_tab forge new-surface --pane "$pane" --focus true) || return

        _cmux_run_when_ready "$remote" "$dir" 'npm run remote:start' || return
        _cmux_run_when_ready "$tunnel" "$dir" 'npm run tunnel:start' || return
        _cmux_run_when_ready "$forge" "$dir" 'npm run forge:deploy && npm run forge:upgrade' || return
    }
fi
