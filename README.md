# hyprland-baya

Post Installation:
Custom Plymouth using systemd-boot:
1. edit /etc/mkinitcpio.conf
2. add plymouth after (systemd) || (udev)
3. sudo plymouth-set-default-theme knight 
4. If using arch.conf, edit /boot/loader/entries/arch.conf, and on options add "rw nomodeset quiet splash" at the end
5. sudo mkinitcpio -P
