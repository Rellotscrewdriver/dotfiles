#!/bin/sh

# Credits to HoNamDuong
# Edited by Rellot's Screwdriver

DIR=$(pwd)
LOCAL_DIR=~/.local/share/fonts 
NERD_FONT_DIR=~/RobotoMono.zip

# Reset
Reset='\033[0m'

# Regular Colors
Blue='\e[0;34m'
Red='\e[0;31m'
Green='\e[0;32m'

# Bold
BRed='\e[1;31m'
BBlue='\e[1;34m'
BGreen='\e[1;32m'


installDependencies() {
  echo "Installing main Arch dependencies"
  paru -Sy --needed $(cat dependencies.txt)
}

installConfig() {
    echo "Installing configs"
    ln -sfvr $DIR/configs/* ~/.config/
    echo "done"
}

installTheme(){
    echo "installing icons, cursors theme and wallpapers"
	sudo mkdir -p /usr/share/themes/Everblush/ /usr/share/icons/ModernIce 
    echo "click yes to install the papirus icons"
    sudo paru -S --noconfirm papirus-icon-theme 
	paru -S --noconfirm bibata-cursor-theme-bin
    sudo cp -r $DIR/theme/GTK/ /usr/share/themes/Everblush/
    echo "done"
}

installGRUB(){
    echo "installing GRUB theme"
	sudo mkdir -p /boot/grub/themes/stylish
	sudo cp -r $DIR/theme/GRUB/ /boot/grub/themes/stylish/
    echo 'GRUB_THEME="/boot/grub/themes/stylish/GRUB/theme.txt"' | sudo tee -a /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    echo "done"
}

installLogin(){
    echo "installing login theme"
	sudo rm -rf /etc/greetd/* 
    sudo cp -r $DIR/theme/login/ /etc/greetd/*
    sudo cp -r $DIR/wallpapers/Night.png /usr/share/backgrounds/greeter.jpg
    sudo systemctl disable display-manager
    sudo systemctl enable greetd
    echo "done"
}

installWallpapers(){
    echo "Creating symlink to wallpapers"
    mkdir ~/wallpapers
    cp -r $DIR/wallpapers ~/wallpapers
}

installFonts(){
    #font
    echo "installing fonts"
    echo "Installing RobotMono nerd font in your local directory"
    mkdir -p $LOCAL_DIR
    if [ -f $NERD_FONT_DIR ]; then
        echo "RobotoMono's font's already there, skip installing it"
    else
        echo "installing the required fonts from the internet, please wait if you do have internet connection"
        wget -qv https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip -O $NERD_FONT_DIR
fi

    unzip -j $NERD_FONT_DIR -d $LOCAL_DIR
    cp $DIR/fonts/* $LOCAL_DIR/
    fc-cache -fv
    rm -f $NERD_FONT_DIR
    echo "font installed"
}

clear

echo -e "${BBlue}                        Welcome to my configuration! ${Reset}"
echo "Select anything you want but this script won't install everything"
echo "so you need to setup some stuff yourself"
echo "after installing do not delete this folder the configs are in, else it won't work properly"
echo -e "${BRed}before you install my config in any of these steps you need to have 'paru' installed"
while :
do
	echo " "
    echo -e  "${BRed}[1] Install Everything"
    echo -e  "${Green}[2] Install Theme "
    echo -e  "${Blue}[3] Install Dependencies "
    echo -e  "${Red}[4] Install GRUB theme "
    echo -e  "${Green}[5] Install Wallpapers"
    echo -e  "${Blue}[6] Only Install Config Files(Sway, Swaylock, btop etc.)"
    echo -e  "${BRed}[0] Quit        ${Reset}"
    echo
    read -p "Enter your choice: " choice
    case $choice in
    0)
        exit
    ;;
    1)
        installDependencies
        installConfig
        installTheme
        installFonts
        installWallpapers
        installLogin
        installGRUB
        echo -e "${BRed} now do a system reboot to see the changes ${Reset}"
        break                
    ;;
    2)	    
        installTheme
        break
    ;;
    3)
        installDependencies
        break
    ;;
    4)
        installGRUB
        break
    ;;
    5)
        installWallpapers
        break
    ;;
    6)
        installConfig
        break
    ;;    
    *)
        echo "Sorry, choice understand"
    ;;
    esac
done
