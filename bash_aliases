alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
