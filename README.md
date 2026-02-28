# arch-conf-scripts
For post-install fixes and configuration of Arch Linux

Do NOT run on any other Linux distro!

⚠️ WARNING: The helper script will directly download and execute scripts from this repo. DO NOT use if your network is facing attacks such as DDoS (Distribution Denial-of-Service) or any other attacks!

### How to run this script
First, install curl:
```shell
sudo pacman -Sy --noconfirm curl
```

Then, run the script:
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MKstarFromSwitch/arch-conf-scripts/HEAD/helper.sh)"
```