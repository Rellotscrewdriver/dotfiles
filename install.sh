#!/bin/sh

# Credits to HoNamDuong
## Directories ----------------------------
DIR=$(pwd)

## Directories ----------------------------
# Reset
Reset='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

clear

while :
do
		echo " "
    echo -e  "${Green} [1] Install Configuration?  ${Reset}"
    echo -e  "${Yellow}[0] Quit        ${Reset}"
    echo
    read -p " Enter your choice: " choice
    case $choice in
    0)
        break
        ;;
    1)
				#configs
				ln -sfvr $DIR/configs/* ~/.config/

				#init filwe
				ln -sfvr $DIR/.xinitrc ~/.xinitrc

				#icons, themes and wallpapers
				mkdir -p ~/.icons/Synthwave ~/.themes/Synthwave/ /wallpapers
				ln -sfvr $DIR/icons/ ~/.icons/Synthwave/
				ln -sfvr $DIR/GTK_theme ~/.themes/Synthwave/
				ln -sfvr $DIR/wallpapers /wallpapers

				#lightdm and greeter
				ln -sfvr $DIR/lightdm.conf /etc/lightdm/lightdm.conf
				ln -sfvr $DIR/web-greeter.yml /etc/lightdm/web-greeter.yml

				#greeter theme
				ln -sfvr $DIR/lightdm/greeter_theme /usr/share/web-greeter/themes/waves
	
				#GRUB theme
				ln -sfvr $DIR/GRUB_theme/Vimix /usr/share/grub/themes
				grep "GRUB_THEME=" /etc/default/grub 2>&1 >/dev/null && sed -i '/GRUB_THEME=/d' /etc/default/grub
				echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> /etc/default/grub
				grub-mkconfig -o /boot/grub/grub.cfg

				#font
        [ ! -d $HOME/.local/share/fonts ] && mkdir -p $HOME/.local/share/fonts
        #ln -sfv $DIR/.local/share/fonts/feather.ttf $HOME/.local/share/fonts/feather.ttf
				
				#wallpapers
				ln -sfvr $DIR/wallpapers /wallpapers

				#installing neovim
				sh $DIR/configs/nvim/install.sh
        ;;
    *)
        echo "Sorry, choice understand"
        ;;
    esac
done
