#!/usr/bin/env bash
echo "Arch Linux keyring fix"
read -p "Press ENTER to fix the keyring" -s
echo
echo "Fixing keyring..."

sudo rm -rf /etc/pacman.d/gnupg
sudo mkdir -p /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux
echo
echo "Done fixing keyring!"
exit 0
