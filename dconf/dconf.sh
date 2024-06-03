#!/bin/bash

operation="$1"

config_file="dconf.txt"

if [ "$operation" = "dump" ]; then
    dconf dump '/' >"$config_file"
fi

if [ "$operation" = "load" ]; then
    dconf load '/' <"$config_file"
fi
