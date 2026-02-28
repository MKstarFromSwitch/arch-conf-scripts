#!/usr/bin/env bash
set -euo pipefail

echo "Arch Linux yay installer"
read -rp "Press ENTER to install yay..."  # Removed -s; user can see prompt
echo

# Update system and install dependencies
echo "Installing dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm
echo

# Clone and install yay
echo "Installing yay... (enter your password if prompted)"
cd "$HOME"
if [[ -d yay ]]; then
    echo "Existing 'yay' directory found. Removing it..."
    rm -rf yay
fi
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo

# Cleanup
echo "Cleaning up..."
cd "$HOME"

read -rp "Remove orphaned packages? [y/N]: " cleanup
if [[ "$cleanup" =~ ^[Yy]$ ]]; then
    orphans=$(pacman -Qdtq || true)
    if [[ -n "$orphans" ]]; then
        echo "Removing orphaned packages..."
        sudo pacman -Rns --noconfirm $orphans
    else
        echo "No orphaned packages found."
    fi
fi

# Remove yay build directory
rm -rf "$HOME/yay"

echo
echo "Yay installation complete!"
exit 0