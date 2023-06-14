#!/bin/bash

operation="$1"

keybinds_file="dconf/keybindings.dconf"
custom_keybinds_file="dconf/custom_keybindings.dconf"

if [ "$operation" = "dump" ]; then
    dconf dump '/org/gnome/desktop/wm/keybindings/' >"$keybinds_file"
    dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' >"$custom_keybinds_file"
fi

if [ "$operation" = "load" ]; then
    dconf load '/org/gnome/desktop/wm/keybindings/' <"$keybinds_file"
    dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' <"$custom_keybinds_file"
fi
