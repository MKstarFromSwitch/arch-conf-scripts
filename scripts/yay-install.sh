#!/usr/bin/env bash
set -euo pipefail
echo "Arch Linux yay installer"
read -p "Press ENTER to install yay..." -s
echo
echo "Installing dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm
echo
echo "Installing yay... (If it asks for your password, enter it)"
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo
echo "Cleaning up..."
cd ~
read -rp "Remove orphaned packages? [y/N]: " cleanup
if [[ "$cleanup" =~ ^[Yy]$ ]]; then
   orphans=$(pacman -Qdtq || true)
   if [[ -n "$orphans" ]]; then
       sudo pacman -Rns $orphans
   else
       echo "No orphaned packages."
   fi
fi

sudo rm -rf ~/yay/
echo
echo "Install complete!"
exit 0
