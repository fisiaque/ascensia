# THIS BASH FILE MAKES SURE ALL NECCESSARY PACKAGES ARE UPDATED
#!/bin/bash

## pacman
packages=(
    "kitty" "firefox" "brightnessctl" "playerctl" "dolphin" 
    "wofi" "pipewire" "wireplumber"
)

sudo pacman -Syu --noconfirm

for package in "${packages[@]}"; do
    sudo pacman -S --noconfirm --needed "$package"
done

## yay
if ! command -v yay &> /dev/null; then
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    rm -rf /tmp/yay
fi

# check if yay exists: then install/refresh packages
if command -v yay &> /dev/null; then
    yay_packages=(
        "quickshell-git"
    )

    yay -Syu --noconfirm

    for yay_package in "${yay_packages[@]}"; do
        yay -S --noconfirm --needed "$yay_package"
    done
fi
