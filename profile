#!/bin/bash

for f in $HOME/.profile.d/*
do
    . $f;
done

export PATH="$HOME/bin:$PATH"
export EDITOR="vim"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -s /opt/homebrew/etc/bash_completion ]] && source /opt/homebrew/etc/bash_completion
