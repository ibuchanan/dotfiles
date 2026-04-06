#!/bin/bash

sorted_config=$(git config --global --list | sort)
# Backup the file, then empty it, so we rewrite to it
cp ~/.gitconfig ~/.gitconfig.bak
> ~/.gitconfig
echo "$sorted_config" | while IFS== read -r key value; do
    if ! git config --global --get-all "$key" | grep -qxF "$value"; then
        git config --global --add "$key" "$value"
    fi
done
