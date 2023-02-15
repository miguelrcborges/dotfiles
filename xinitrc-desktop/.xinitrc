if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export GTK_THEME=Catppuccin-Mocha-Lavender:dark
QT_QPA_PLATFORMTHEME=qt5ct

export PATH=$PATH:~/.local/bin

xrandr --output DP-4 --mode 1920x1080 --rate 144.00 --output DVI-D-0 --mode 1920x1080 --rate 144.00 --right-of DP-4

feh --bg-scale ~/Wallpapers/gruvbox.jpg
nvidia-settings --load-config-only

xrdb .Xresources
exec dwm
