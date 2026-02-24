#!/usr/bin/env bash
OWNUSER="$USER"

echo "Arch Linux yay installer"
read -p "Press ENTER to install yay..." -s
echo
echo "Installing dependencies..."
sudo pacman -Syyu
sudo pacman -S --needed base-devel
sudo pacman -S --noconfirm git
echo
echo "Installing yay... (If it asks for your password, enter it)"
cd ~
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $OWNUSER:users yay
cd yay
makepkg -si
echo
echo "Cleaning up..."
cd ~
sudo pacman -Rns --noconfirm $(pacman -Qdtq)
sudo rm -rf ~/yay/
echo
echo "Install complete!"
exit 0
