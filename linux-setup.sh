sudo pacman -S bspwm sxhkd xorg xorg-xinit stow rofi alacritty feh
git clone https://github.com/miguelrcborges/dotfiles
cd
rm .bashrc
cd dotfiles
stow dots
cd
chmod +x .config/bspwm/bspwmrc
yay -S nerd-fonts-jetbrains-mono librewolf catppuccin-gtk-theme
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'