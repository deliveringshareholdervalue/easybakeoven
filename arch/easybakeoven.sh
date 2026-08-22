#!/bin/bash
# logo 
cat easybakeoven.txt
echo
echo
echo "Welcome to Arch! at this point you should already be chrooted!"

if ! command -v sudo &> /dev/null; then
	echo "sudo is not installed, please install. exiting script" >&2
	exit 1
fi 

echo "sudo found! starting script!"
echo
sleep 1

while true; do
   read -p "Download packages? (y/n): " yn
   case $yn in 
        [Yy]* )
            echo "I Use Arch BTW!"
            
            # pacman update without conformation
            sudo pacman -Syu --noconfirm
            # install base packages
           sudo pacman -Sy --noconfirm git base-devel firefox fastfetch ufw prismlauncher networkmanager grub efibootmgr
echo "Building AUR!"
                      # AUR Build script in arch directory
                     ./aur.sh
echo
echo
echo "building locales!"
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us1" >> /etc/vconsole.conf
echo -e "\e[31mGenerating Initramfs!\e[0m"
# generates initramfs
mkinitcpio -P
echo "\e[31mbuilding grub!\e[0m"
# installs grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
                       break
                       ;;
                    [Nn]* )
                      echo "Installation Aborted!"
                      exit 0
                      ;;
                   *)
                      echo "Please select yes or no."
                        ;;
                   
                        esac
            
cat please-configure.txt

done
