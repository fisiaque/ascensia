# THIS BASH FILE MAKES SURE ALL NECCESSARY PACKAGES ARE UPDATED
#!/bin/bash
packages=(
    "kitty" "firefox" "brightnessctl" "playerctl" "dolphin" 
    "wofi" "wpctl"
)

sudo pacman -Syu

for package in "${packages[@]}"; do
    sudo pacman -S --noconfirm --needed "$package"
done
