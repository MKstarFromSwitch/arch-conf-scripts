#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "Do not run this as root."
  echo "You won't have issues, but root is unnecessary."
  exit 1
fi

echo "Arch Linux keyring fix"
read -rp "Press ENTER to fix the keyring..."
echo
echo "Deleting existing keyring..."

sudo rm -rf /etc/pacman.d/gnupg
sudo mkdir -p /etc/pacman.d/gnupg

echo "Creating new keyring..."
sudo pacman-key --init
sudo pacman-key --populate archlinux
echo
echo "Done fixing keyring!"
exit 0
