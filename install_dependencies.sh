yay -S xorg-startx maim xclip kitty nerd-fonts-jetbrains-mono catppuccin-gtk-theme-mocha librewolf-bin rofi dmenu

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
