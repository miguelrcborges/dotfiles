sudo pacman -S bspwm sxhkd xorg xorg-xinit stow rofi alacritty feh wireplumber pipewire pipewire-alsa pipewire-jack pipewire-pulse pulsemixer maim xclip noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra polybar dmenu mutter gnome-shell gnome-session nautilus gnome-control-center gnome-tweaks

systemctl enable --user pipewire --now
systemctl enable --user pipewire-pulse --now

git clone https://github.com/miguelrcborges/dotfiles
cd
rm .bashrc
cd dotfiles
stow dots
cd
chmod +x .config/bspwm/bspwmrc
yay -S nerd-fonts-jetbrains-mono librewolf catppuccin-gtk-theme-mocha
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo echo '<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
    <edit name="antialias" mode="assign">
      <bool>true</bool>
    </edit>
    <edit name="hinting" mode="assign">
      <bool>true</bool>
    </edit>
    <edit mode="assign" name="rgba">
      <const>rgb</const>
    </edit>
    <edit mode="assign" name="hintstyle">
      <const>hintslight</const>
    </edit>
    <edit mode="assign" name="lcdfilter">
      <const>lcddefault</const>
    </edit>
  </match>
</fontconfig>' >> /etc/fonts/local.conf

sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

