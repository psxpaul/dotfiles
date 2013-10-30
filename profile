#!/bin/bash

export GIT_EMAIL="psxpaul@gmail.com"
export JAVA_HOME=$HOME/jdk1.7.0_25

export PATH="$HOME/bin:$JAVA_HOME/bin:$PATH"
export EDITOR="vim"

for f in $HOME/.profile.d/*
do
    . $f;
done
