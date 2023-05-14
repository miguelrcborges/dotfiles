# Shell prompt
export PS1="\[$(tput setaf 2)\]\u\[$(tput setaf 3)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 6)\]\w \[$(tput setaf 1)\]> \[$(tput sgr0)\]"

# Alias

alias vi='nvim'
alias vim='nvim'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lwine='WINEPREFIX="$(pwd)/winecfg" wine'
alias klwine='WINEPREFIX="$(pwd)/winecfg" wineserver -k'

# Vi mode <on startup is on insert mode>
set -o vi
