# hyprland-baya Ascensia!
Built on systemd-boot, instructions based off systemd-boot!

Post Installation:
Bugs:
- If screen turns black on encryption password screen upon booting, then use "nomodeset" on arch.conf (edit /boot/loader/entries/arch.conf) at end of 'options'

Custom Plymouth:
1. edit /etc/mkinitcpio.conf
2. add plymouth after (systemd) || (udev)
3. sudo plymouth-set-default-theme knight 
4. edit /boot/loader/entries/arch.conf, and on options add "rw quiet splash" at the end!
5. sudo mkinitcpio -P
