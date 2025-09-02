#!/bin/bash

# Packages to install
packages=(
    "foot" "brightnessctl" "playerctl" "thunar" 
    "wofi" "pipewire" "wireplumber" "mpv" "vim"
    "hyprpolkitagent" "gvfs" "gwenview" "firefox"
    "plymouth" 
)

# Build pacman options based on NOCONFIRM
PACMAN_OPTS=""
if [ "$NOCONFIRM" = true ]; then
    echo "Running in no-confirm mode"
    PACMAN_OPTS="$PACMAN_OPTS --noconfirm"
fi

# Update system
sudo pacman -Syu $PACMAN_OPTS

# Install packages
for package in "${packages[@]}"; do
    sudo pacman -S $PACMAN_OPTS --needed "$package"
done

# Install yay if missing
if ! command -v yay &> /dev/null; then
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    if [ "$NOCONFIRM" = true ]; then
        makepkg -si --noconfirm
    else
        makepkg -si
    fi
    rm -rf /tmp/yay
fi

# Refresh yay packages
if command -v yay &> /dev/null; then
    YAY_OPTS=""
    if [ "$NOCONFIRM" = true ]; then
        YAY_OPTS="--noconfirm"
    fi

    yay -Syu $YAY_OPTS

    yay_packages=(
        "quickshell-git"
    )

    for yay_package in "${yay_packages[@]}"; do
        yay -S $YAY_OPTS --needed "$yay_package"
    done
fi
