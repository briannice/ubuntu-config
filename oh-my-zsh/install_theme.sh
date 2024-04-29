#!/bin/bash

dst_dir="$HOME/.oh-my-zsh/custom/themes"
dst_file="$dst_dir/brein.zsh-theme"

if [ -d "$dst_dir" ]; then
    cp "brein.zsh-theme" "$dst_file"
fi
