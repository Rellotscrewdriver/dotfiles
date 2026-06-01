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
  paru -R --noconfirm swaylock
  paru -Sy --noconfirm --needed $(cat dependencies.txt)
  cd packages/CustomEww && makepkg -si && cd ../..
}

installConfig() {
    echo "Installing configs"
    cp -r $DIR/configs/* ~/.config/
    code --install-extension "mangeshrex.everblush"
    # this rsync is only used for copying the VScode theme 
    # cuz normal cp is being a smartass and fuck up the extension folder structure
    rsync -av ./configs/VScode/* ~/.vscode-oss/extensions/mangeshrex.everblush*
    rm -rf ~/.config/VScode
    sudo pacman -R --noconfirm rsync
    chsh -s $(which fish)
    echo "done"
}

installTheme(){
    echo "installing icons, cursors theme and wallpapers... "
	sudo mkdir -p /usr/share/icons/ModernIce ~/.themes
    sudo paru -S --noconfirm papirus-icon-theme bibata-cursor-theme-bin 
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
    echo "Installing RobotoMono nerd font in your local directory"
    mkdir -p $LOCAL_DIR
    mkdir -p ~/FontTemp/
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

installParu(){
    if ! pacman -Qm "paru" &>/dev/null ; then
        echo "Installing Paru my boi"
        git clone https://aur.archlinux.org/paru.git packages/paru
        cd packages/paru && makepkg -si && cd ../..
    else
        echo "Skipping paru"
    fi
}

uninstall(){
    rm -rf ~/.themes/Everblush*
    rm -rf ~/wallpapers
    #this command might fuckup the login greeter and make arch unusable
    #sudo rm -rf /etc/greetd/* 
    sudo rm -rf /usr/share/backgrounds/greeter.jpg
    #this command might arch unusable so I commented this out
    #if you wanna be a sling shooter, go ahead uncomment this out
    #paru -Rnsc --needed $(cat dependencies.txt)

	sudo rm -rf /usr/share/icons/ModernIce
    sudo paru -Rnsc --noconfirm papirus-icon-theme bibata-cursor-theme-bin

	sudo rm -rf /boot/grub/themes/stylish
    sudo sed -i 's/^GRUB_THEME=/#GRUB_THEME=/' /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg

    echo "${BRed}Partial Removal is done, remove uneeded configs and packages at your desicion ${Reset}"
}

uninstallMenu(){
    echo -e "${BRed} Welcome to my Uninstall Menu! ${Reset}"
    echo "Select anything you want to remove"
    echo "some options might break your system! remove what you don't need"
    echo "this menu won't delete everything so as to slightly protect your system"
    echo " "
    echo -e "${BRed}[1] Uninstall Everything(This May Break your system!)"
    echo -e "${Red}[2] Uninstall GRUB theme"
    echo -e "${Red}[3] Uninstall Wallpapers"
    echo -e "${Red}[4] Uninstall the GTK/Qt theme"
    echo -e "${Green}[0] Quit        ${Reset}"
    echo
    read -p "Enter your choice: " choice
    clear
    case $choice in    
    0)
        exit
    ;;
    1)
        uninstall
        echo -e "${BRed} now do a system reboot to see the changes ${Reset}"
        break                
    ;;
    2)
	    sudo rm -rf /boot/grub/themes/stylish
        sudo sed -i 's/^GRUB_THEME=/#GRUB_THEME=/' /etc/default/grub
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        break
    ;;
    3)
        rm -rf ~/wallpapers
        sudo rm -rf /usr/share/backgrounds/greeter.jpg
        break
    ;;
    4)
        rm -rf ~/.themes/Everblush*
	    sudo rm -rf /usr/share/icons/ModernIce
        paru -Rnsc --noconfirm papirus-icon-theme bibata-cursor-theme-bin
        sudo rm -r /usr/share/themes/Everblush*
        break
    ;;
    *)
        echo "Sorry, choice understand"
        break
    ;;
    esac
}

clear

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
    echo -e "${Red} now disable your login manager with greetd"
    echo -e "${BRed} then do a system reboot to see the changes ${Reset}"
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
