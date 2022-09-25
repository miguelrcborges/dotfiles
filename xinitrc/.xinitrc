export GTK_THEME=Catppuccin-blue:dark

export PATH=$PATH:~/.local/bin

setxkbmap pt
feh --bg-scale ~/Wallpapers/dither-1988089278_Cyberpunk__City_night__Realistic__Wallpaper__4k__Retrowave__Synthwave__upscayl_4x_realesrgan-x4plus-anime.png
xrandr --output eDP --brightness 0.4
xrdb .Xresources
exec dwm
