#!/usr/bin/env bash
set -euo pipefail

echo "arch-conf-scripts helper"
echo "Choose what to do:"
echo "Note: Some scripts might ask for your password, if they do just enter it."
echo
echo "1) Install yay (pacman for the AUR)"
echo "2) Fix the Arch Linux keyring (useful if your pacman keyring is broken)"
echo

read -rp "Choose an option: " option

case "$option" in
    1)
     echo "Fetching and running yay installer..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MKstarFromSwitch/arch-conf-scripts/HEAD/scripts/yay-install.sh)"
     exit 0
     ;;
    2)
     echo "Fetching and running keyring fix..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MKstarFromSwitch/arch-conf-scripts/HEAD/scripts/keyring-fix.sh)"
     exit 0
     ;;
    *)
     echo "Invalid option."
     exit 1
     ;;
esac

