#!/bin/sh

# Credits to HoNamDuong
# Edited by Rellot's Screwdriver

DIR=$(pwd)
LOCAL_DIR=~/.local/share/fonts 
NERD_FONT_DIR=~/FontTemp/RobotoMono.zip

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
  paru -Sy --noconfirm --needed $(cat dependencies.txt)
  #build my custom eww
  makepkg -si
}

installConfig() {
    echo "Installing configs"
    cp -r $DIR/configs/* ~/.config/
    code --install-extension "mangeshrex.everblush"
    # this rsync is only used for copying the VScode theme 
    # cuz normal cp is being a smartass and fuck up the folder structure
    rsync -av ./configs/VScode/* ~/.vscode-oss/extensions/mangeshrex.everblush*
    rm -rf ~/.config/VScode
    sudo pacman -R rsync
    makepkg -si
    chsh -s $(which fish)
    echo "done"
}

installTheme(){
    echo "installing icons, cursors theme and wallpapers... "
	sudo mkdir -p /usr/share/icons/ModernIce ~/.themes
    sudo paru -S --noconfirm papirus-icon-theme 
	paru -S --noconfirm bibata-cursor-theme-bin
    sudo cp -r $DIR/theme/GTK/* ~/.themes
    echo "done"
}

installGRUB(){
    echo "installing GRUB theme... "
	sudo mkdir -p /boot/grub/themes/stylish
	sudo cp -r $DIR/theme/GRUB/* /boot/grub/themes/stylish/
    echo 'GRUB_THEME="/boot/grub/themes/stylish/theme.txt"' | sudo tee -a /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    echo "done"
}

installLogin(){
    echo "installing login theme... "
    sudo cp -r $DIR/theme/login/* /etc/greetd/
    sudo cp -r $DIR/wallpapers/Night.png /usr/share/backgrounds/greeter.jpg
    echo "done"
}

installWallpapers(){
    echo "Creating symlink to wallpapers... "
    mkdir ~/wallpapers
    cp -r $DIR/wallpapers/* ~/wallpapers
    echo "done"
}

installFonts(){
    # install font
    echo "installing fonts... "
    echo "Installing RobotMono nerd font in your local directory"
    mkdir -p $LOCAL_DIR
    if [ -f $NERD_FONT_DIR ]; then
        echo "RobotoMono's font's already there, skip installing it"
    else
        echo "installing the required fonts from the internet, please wait if you do have internet connection"
        wget -v https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip -O $NERD_FONT_DIR
        unzip -j $NERD_FONT_DIR -d $LOCAL_DIR
        fc-cache -fv
        rm -f $NERD_FONT_DIR
    fi

    cp $DIR/fonts/* $LOCAL_DIR/
    echo "font installed"
}

#TODO: make an uninstall script as well
#TODO: install my custom eww repo
#TODO: make an uninstall menu!

installParu(){
    if ! pacman -Qm "paru" &>/dev/null ; then
        echo "Installing Paru my boi"
        git clone https://aur.archlinux.org/paru.git
        cd paru && makepkg -si
    else
        echo "Skipping paru"
    fi
}

uninstallMenu(){
echo -e "${BBlue}                        Welcome to my configuration! ${Reset}"
echo "Select anything you want to remove"
echo "some options might break your system! remove what you don't need"
echo " "
echo -e  "${BRed}[1] Uninstall Everything(May Break your system!)"
echo -e  "${BRed}[2] Uninstall Theme "
echo -e  "${BRed}[3] Uninstall Dependencies "
echo -e  "${Red}[4] Uninstall GRUB theme "
echo -e  "${Green}[5] Uninstall Wallpapers"
echo -e  "${Blue}[6] Uninstall Config Files"
echo -e  "${Red}[7] Uninstall the GTK/Qt theme"
echo -e  "${BRed}[0] Quit        ${Reset}"
echo
read -p "Enter your choice: " choice
clear
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
    clear
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
9)
    clear
    uninstall
    break
;;    
*)
    echo "Sorry, choice understand"
    break
;;
esac
}

uninstall(){
    rm -rf ~/.themes/Everblush*
    rm -rf ~/wallpapers
    #sudo rm -rf /etc/greetd/* 
    sudo rm -rf /usr/share/backgrounds/greeter.jpg
    #paru -Rnsc --needed $(cat dependencies.txt)

	sudo rm -rf /usr/share/icons/ModernIce
    #sudo paru -Rnsc --noconfirm papirus-icon-theme 
	#sudo paru -Rnsc --noconfirm bibata-cursor-theme-bin
    sudo rm -r /usr/share/themes/Everblush*

    echo "${BRed}Partial Removal is done, remove uneeded configs and packages at your desicion"
}

printf "%*s%s\n" $(( ( $(tput cols) - ${#text} ) / 2 )) "" "Welcome to my configuration! ${Reset}"   
echo -e "${BBlue} Welcome to my configuration! ${Reset}"
echo "Select anything you want but this script won't install everything"
echo "so you need to setup some stuff yourself"
echo "after installing do not delete this folder the configs are in, else it won't work properly"
echo -e "${BRed}before you install my config in any of these steps you need to have 'paru' installed"
echo " "
echo -e  "${BRed}[1] Install Everything"
echo -e  "${Green}[2] Install Theme "
echo -e  "${Blue}[3] Install Dependencies "
echo -e  "${Red}[4] Install GRUB theme "
echo -e  "${Green}[5] Install Wallpapers"
echo -e  "${Blue}[6] Only Install Config Files(Sway, Swaylock, btop etc.)"
echo -e  "${Red}[9] Uninstall the theme"
echo -e  "${BRed}[0] Quit        ${Reset}"
echo
read -p "Enter your choice: " choice
clear
case $choice in    
0)
    exit
;;
1)
    installParu
    installDependencies
    installConfig
    installTheme
    installFonts
    installWallpapers
    installLogin
    installGRUB
    clear
    echo -e "${BRed} now do a system reboot to see the changes ${Reset}"
    break                
;;
2)	
    installParu    
    installTheme
    break
;;
3)
    installParu
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
9)
    clear
    uninstallMenu
    break
;;    
*)
    echo "Sorry, choice understand"
    break
;;
esac
