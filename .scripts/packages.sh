#!/bin/bash

# Packages to install
packages=(
    "base-devel" "kitty" "brightnessctl" "playerctl" "thunar" 
    "wofi" "pipewire" "wireplumber" "mpv" "neovim"
    "hyprpolkitagent" "gvfs" "gwenview" "firefox"
    "plymouth" 
)

# Build options 
OPTS=""
if [ "$NOCONFIRM" = true ]; then
    echo "Running in no-confirm mode"
    OPTS="$OPTS --noconfirm"
fi
if [ "$NEEDED" = true ]; then
    echo "Running in needed mode"
    OPTS="$OPTS --needed"
fi

# Update system
sudo pacman -Syu 

# Install packages
sudo pacman -S $OPTS "${packages[@]}"

# Install yay if missing
if ! command -v yay &> /dev/null; then
    mkdir -p /tmp/yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit
    if [ "$NOCONFIRM" = true ]; then
        makepkg -si --noconfirm
    else
        makepkg -si
    fi
    rm -rf /tmp/yay
fi

# Refresh yay packages
if command -v yay &> /dev/null; then
    yay -Syu 

    yay_packages=(
        "aylurs-gtk-shell-git" "libastal-io-git" "libastal-git"
        "libastal-battery-git" "libastal-powerprofiles-git"
    )

    yay -S $OPTS "${yay_packages[@]}"
fi
