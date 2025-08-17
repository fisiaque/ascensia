#!/bin/bash
script_directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
destination_directory="$HOME/.config/"

#echo "The configs directory: $script_directory/.config/"
#echo "The destination directory: $destination_directory"

for f in "$script_directory/.config/"*; do
    target="$destination_directory$(basename "$f")"

    if [ -d "$target" ]; then
        rm -rf "$target"
    fi
    
    ln -sf "$f" "$target"
done

echo "Finished Initializing Baya's Hyprland Dotfiles!"