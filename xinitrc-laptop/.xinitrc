if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GTK_THEME=Catppuccin-Mocha-Lavender-hdpi:dark

export PATH=$PATH:~/.local/bin

setxkbmap pt
feh --bg-scale ~/Wallpapers/gruvbox.jpg
xrdb .Xresources
sbar &
exec dwm
