# Enable Colors and custom prompt
autoload -U colors && colors
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$reset_color%}%b  "


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	


# Aliases
alias xq="xbps-query -Rs"
alias xr="sudo xbps-remove -R"
alias vi="nvim"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
