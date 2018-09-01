alias ll='ls -lh'
alias df='df -h'

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
