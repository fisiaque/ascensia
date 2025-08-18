# THIS SH FILE REPLACES The OLD CONFIGS WITH MY UPDATED ONES
#!/bin/bash
parent_directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
scripts_directory="$parent_directory/.scripts/"
destination_directory="$HOME/.config/"

# RUN PACKAGES
bash "$scripts_directory/packages.sh"

systemctl --user start pipewire
systemctl --user enable pipewire

for f in "$parent_directory/.config/"*; do
    target="$destination_directory$(basename "$f")"

    if [ -d "$target" ]; then
        rm -rf "$target"
    fi
    
    ln -sf "$f" "$target"
done

echo "Finished Updating Baya's Hyprland Dotfiles!"