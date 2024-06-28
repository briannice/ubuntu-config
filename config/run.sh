#!/bin/bash

op="$1"

if [ -z "$op" ]; then
    echo "No operation provided..."
    exit 1
fi

if [ "$op" != "import" ] && [ "$op" != "export" ]; then
    echo "Invalid operation..."
    exit 1
fi

if [ ! -d "files" ]; then
    mkdir -p "files"
fi

# -------------------------------------
# DCONF
# -------------------------------------

dconf_store="files/dconf.txt"

if [ "$op" == "import" ]; then
    dconf load '/' <"$dconf_store"
elif [ "$op" == "export" ]; then
    dconf dump '/' >"$dconf_store"
fi

# -------------------------------------
# TMUX
# -------------------------------------

tmux_config="$HOME/.tmux.conf"
tmux_store="files/.tmux.conf"

if [ "$op" == "import" ]; then
    cp "$tmux_store" "$tmux_config"
elif [ "$op" == "export" ]; then
    cp "$tmux_config" "$tmux_store"
fi

# -------------------------------------
# ZSH
# -------------------------------------

zsh_config="$HOME/.zshrc"
zsh_store="files/.zshrc"

if [ "$op" == "import" ]; then
    cp "$zsh_store" "$zsh_config"
elif [ "$op" == "export" ]; then
    cp "$zsh_config" "$zsh_store"
fi
