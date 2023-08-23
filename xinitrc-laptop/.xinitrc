if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export PATH=$PATH:~/STMicroeletronics/STM32Cube/STM32CubeProgrammer/bin

feh --bg-scale ~/Wallpapers/gruvbox.jpg
xrdb .Xresources
sbar &
exec dwm
