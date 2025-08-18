# THIS BASH FILE MAKES SURE ALL NECCESSARY PACKAGES ARE UPDATED
#!/bin/bash
packages=(
    "kitty" "firefox" "brightnessctl" "playerctl" "dolphin" 
    "wofi" 
)

sudo pacman -Syu

for package in "${packages[@]}"; do
    if ! pacman -Q "$package" &> /dev/null; then
        echo "$package is not installed. Installing..."
        sudo pacman -S --noconfirm -needed "$package"
    else
        echo "$package is already installed."
    fi
done
