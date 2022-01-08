export EDITOR=nvim
export BROWSER=firefox
export VISUAL=nvim
export PATH="${PATH}:${HOME}/.local/bin/"

sxhkd &
exec bspwm
