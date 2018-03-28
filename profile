#!/bin/bash

export GIT_EMAIL="psxpaul@gmail.com"

export PATH="$HOME/bin:$PATH"
export EDITOR="vim"

for f in $HOME/.profile.d/*
do
    . $f;
done

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
