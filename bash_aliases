alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'
#alias gvim='gvim --remote-tab-silent'

function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
