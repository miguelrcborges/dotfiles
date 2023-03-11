yay -S xorg-startx maim xclip xterm ttf-jetbrains-mono-nerd gruvbox-material-gtk-theme-git rofi dmenu

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
