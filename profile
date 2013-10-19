#!/bin/bash

export JAVA_HOME=$HOME/src/tools/jdk1.7.0_21
export SCALA_HOME=$HOME/src/tools/scala-2.10.2
export PATH="$HOME/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$PATH"
export EDITOR="vim"

# source your bashrc for tmux
case $- in
*i*)
    . ~/.bashrc
    stty -ixon
    ;;
esac
