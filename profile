#!/bin/bash

export JAVA_HOME=$HOME/src/tools/jdk1.6.0_45
export GRAILS_HOME=$HOME/src/tools/grails-2.1.3
export M2_HOME=/usr/share/maven

#export MALLOC_CHECK=0
#export MAVEN_OPTS="-Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512m"

export PATH="$HOME/bin:$JAVA_HOME/bin:$GRAILS_HOME/bin:$PATH"
export EDITOR="vim"

# source your bashrc for tmux
case $- in
*i*)
    . ~/.bashrc
    stty -ixon
    ;;
esac
