alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'

alias setclasspath='for i in $(ls *.jar *.properties); do export CLASSPATH=$CLASSPATH:$i; done'

#alias preCheckin='p4 sync && mvn cj:build-stale -Dgoals=clean,install,-Dtest=asdf,-Ddelta.skip=true && mvn cj:build-change-dependents -Dgoals=clean,-Ddelta.skip=true && mvn cj:build-stale -Dgoals=clean,install,-Ddelta.skip=true,-Pft'

alias sqlplus='rlwrap sqlplus'
alias mci='mvn clean install'
alias prc='cd ~/src/prc/main'
alias cjo='cd ~/src/cjo/main'
alias main='cd ~/src/cjo/main'
#alias git-p4='P4CLIENT=proberts-git-p4 git-p4'

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
