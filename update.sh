# THIS SH FILE REPLACES The OLD CONFIGS WITH MY UPDATED ONES
#!/bin/bash
parent_directory=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
scripts_directory="$parent_directory/.scripts/"

# RUN PACKAGES
bash "$scripts_directory/packages.sh"

## edit .config
for f in "$parent_directory/.config/"*; do
    target="$XDG_CONFIG_HOME/$(basename "$f")"

    if [ -d "$target" ]; then
        rm -rf "$target"
    fi
    
    ln -sf "$f" "$target"
done

## edit wayland sessions
for f in "$parent_directory/.wayland-sessions/"*; do
    target="/usr/share/wayland-sessions/$(basename "$f")"
    sudo cp -f "$f" "$target" ## since only a file
done

## edit plymouth-themes 
for f in "$parent_directory/.plymouth-themes/"*; do
    target="/usr/share/plymouth/themes/$(basename "$f")"
    sudo cp -rf "$f" "$target" ## since only a file
done

echo "Finished Updating Baya's Hyprland Dotfiles!"