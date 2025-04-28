#!/bin/sh

# Credits to HoNamDuong
# I apologize for not using functions because I am not good enough in shell scripting
## Directories ----------------------------
DIR=$(pwd)
LOCAL_DIR=~/.local/share/fonts 
NERD_FONT_DIR=~/RobotoMono.zip

## Directories ----------------------------
# Reset
Reset='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Yellow='\033[0;33m'       # Yellow
Cyan='\033[0;36m'         # Cyan

# Bold
BBlack='\033[1;30m'       # Black
BYellow='\033[1;33m'      # Yellow
BCyan='\033[1;36m'        # Cyan

clear

echo -e "${Yellow}               Welcome to my configuration!"
echo "Select anything you want and it will link to destinated folder"
echo "after installing do not delete this folder the configs are in, else it won't work properly"
while :
do
		echo " "
    echo -e  "${Yellow} [1] Install Everything"
    echo -e  "${Cyan} [2] Install Theme       "
    echo -e  "${Yellow} [3] Install Icons "
    echo -e  "${Cyan} [4] Create Token "
    echo -e  "${Yellow} [5] Install Wallpapers"
    echo -e  "${Cyan} [6] Install Config Files(Sway, Swaylock, btop etc.)"
    echo -e  "${Yellow} [0] Quit        ${Reset}"
    echo
    read -p " Enter your choice: " choice
    case $choice in
    0)
        break
        ;;
    1)
				#configs
                echo "Installing configs"
				ln -sfvr $DIR/configs/* ~/.config/
				
                echo "copying wlogout icons(this wouldn't work unless you're in sudo mode)"
                sudo mkdir /usr/share/wlogout/icons/
                sudo ln -sfvr $DIR/configs/wlogout/icons/* /usr/share/wlogout/icons/

                echo "setting permissions for github.sh and weather.sh"
				chmod +x $DIR/configs/waybar/github.sh
				chmod +x $DIR/configs/waybar/weather.sh

                echo "creating a token"
                touch ~/.config/waybar/token
                read -p "Enter the github token: " token
                echo $token > ~/.config/waybar/token

				echo "installing icons theme and wallpapers"
				mkdir -p ~/.icons/Synthwave ~/.themes/Synthwave/ /wallpapers
				ln -sfvr $DIR/icons/ ~/.icons/Synthwave/
				ln -sfvr $DIR/GTK_theme ~/.themes/Synthwave/
				ln -sfvr $DIR/wallpapers /wallpapers
	
				#font
                echo "installing fonts"
                echo "Installing RobotMono nerd font in your local directory"
                mkdir -p $LOCAL_DIR
                if [ -f $NERD_FONT_DIR ]; then
                    echo "RobotoMono's font's already there, skip installing it"
                else
                    echo "installing the required fonts from the internet, please wait if you do have internet connection"
                    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip -O $NERD_FONT_DIR
                fi

                unzip -j $NERD_FONT_DIR -d $LOCAL_DIR
                fc-cache -f
                rm -f $NERD_FONT_DIR

				#wallpapers
				ln -sfvr $DIR/wallpapers ~/wallpapers
        break                
    ;;
    2)	    
        echo "installing theme"
        mkdir -p ~/.themes/Synthwave/
		ln -sfvr $DIR/GTK_theme ~/.themes/Synthwave/
        break
    ;;
    3)
        echo "installing icons"
	    mkdir -p ~/.icons/Synthwave
		ln -sfvr $DIR/icons/ ~/.icons/Synthwave/
        break
    ;;
    4)
        echo "creating a token"
        touch ~/.config/waybar/token
        read -p "Enter the github token: " token
        echo $token > ~/.config/waybar/token
        break
    ;;
    5)
        echo "Creating symlink to wallpapers"
        mkdir ~/wallpapers
	    ln -sfvr $DIR/wallpapers ~/wallpapers
        break
    ;;
    6)
        echo "Installing configs"
		ln -sfvr $DIR/configs/* ~/.config/
				
        echo "copying wlogout icons(this wouldn't work unless you're in sudo mode)"
        sudo mkdir /usr/share/wlogout/icons/
        ln -sfvr $DIR/configs/wlogout/icons/* /usr/share/wlogout/icons/

        echo "setting permissions for github.sh and weather.sh"
		chmod +x $DIR/configs/waybar/github.sh
		chmod +x $DIR/configs/waybar/weather.sh

		#font
        echo "installing fonts"
        echo "Installing RobotMono nerd font in your local directory"
        mkdir -p $LOCAL_DIR
        if [ -f $NERD_FONT_DIR ]; then
            echo "RobotoMono's font's already there, skip installing it"
        else
            echo "installing the required fonts from the internet, please wait if you do have internet connection"
            wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/RobotoMono.zip -O $NERD_FONT_DIR
        fi

        unzip -j $NERD_FONT_DIR -d $LOCAL_DIR
        fc-cache -f
        rm -f $NERD_FONT_DIR

        break
    ;;    
    *)
        echo "Sorry, choice understand"
        ;;
    esac
done
