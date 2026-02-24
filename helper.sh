#!/usr/bin/env bash
set -euo pipefail

echo "arch-conf-scripts helper"
echo "Choose what to do:"
echo "Note: These scripts might ask for your password, in that case just enter it."
echo "1) Install yay (pacman for the AUR)"
echo "2) Fix the Arch Linux keyring (to use pacman after misconfigured keyring in install)"
read -rp "Choose an option: " option

case "$option" in
    1)
     echo "Getting and running script..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MKstarFromSwitch/arch-conf-scripts/HEAD/scripts/yay-install.sh)"
     exit 0
     ;;
    2)
     echo "Getting and running script..."
     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MKstarFromSwitch/arch-conf-scripts/HEAD/scripts/keyring-fix.sh)"
     exit 0
     ;;
    *)
     echo "Invalid choice."
     exit 1
     ;;
esac

