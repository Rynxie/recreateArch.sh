#!/bin/bash

# Başlangıç mesajı


# İhtiyaç duyulan paketleri yükle
sudo pacman -S --needed git base-devel

# yay-bin deposunu klonla ve yükle
if [ -d "yay-bin" ]; then
    echo "yay-bin dizini zaten mevcut. Yeniden klonlanmıyor."
else
    git clone https://aur.archlinux.org/yay-bin.git
fi

cd yay-bin
makepkg -si --noconfirm
cd ..

# Paket listesini tanımla
declare -a packages=(
    "nvidia"
    "nvidia-prime"
    "nvidia-settings"
    "nvidia-utils"
    "hyprland"
    "hyprpaper"
    "xdg-desktop-portal-hyprland"
    "swaylock"
    "swaync"
    "waybar"
    "alacritty"
    "android-file-transfer"
    "gcc"
    "gdb"
    "arm-none-eabi-gcc"
    "arm-none-eabi-gdb"
    "arm-none-eabi-newlib"
    "openocd"
    "blueman"
    "firefox"
    "cantarell-fonts"
    "catppuccin-gtk-theme-mocha"
    "flatpak"
    "gnome-calculator"
    "nautilus"
    "fastfetch"
    "nwg-look"
    "pipewire"
    "pipewire-alsa"
    "pipewire-pulse"
    "polkit-gnome"
    "pywall"
    "qt5"
    "qt6"
    "rofi-lbonn-wayland-git"
    "saleae-logic2"
    "sddm-sugar-candy-git"
    "steam"
    "sddm"
    "stm32cubemx"
    "wireplumber"
    "xwaylandvideobridge"
    "visual-studio-code-bin"
    "papirus-icon-theme"
    "kicad"
    "kicad-library"
    "kicad-library-3d"
    "envycontrol"
)

# Paketleri yükle
for package in "${packages[@]}"
do
    yay -S --noconfirm $package
done

# dotfiles reposunu klonla
if [ -d "dotfiles" ]; then
    echo "dotfiles dizini zaten mevcut. Yeniden klonlanmıyor."
else
    git clone https://github.com/Rynxie/dotfiles.git
fi

# .config dizinine kopyala
if [ -d "dotfiles/.config" ]; then
    cp -r dotfiles/.config/* ~/.config/
    echo ".config dizinine kopyalama tamamlandı."
else
    echo "dotfiles dizininde .config klasörü bulunamadı."
fi

# .bashrc ve .zshrc dosyalarını ana dizine kopyala
if [ -f "dotfiles/.bashrc" ]; then
    cp dotfiles/.bashrc ~/
    echo ".bashrc dosyası kopyalandı."
else
    echo "dotfiles dizininde .bashrc dosyası bulunamadı."
fi

if [ -f "dotfiles/.zshrc" ]; then
    cp dotfiles/.zshrc ~/
    echo ".zshrc dosyası kopyalandı."
else
    echo "dotfiles dizininde .zshrc dosyası bulunamadı."
fi

cd ~

mkdir personalFolder
cd personalFolder
mkdir projects
mkdir games
mkdir kiCadDesigns

echo "Done. Rebooting"
