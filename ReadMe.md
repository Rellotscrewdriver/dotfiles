# ✨ My workstation ✨
This is my personal dotfiles repository. The theme name is everblush.

https://github.com/user-attachments/assets/90444bc6-ae1f-4b51-9f51-5396e4caa6d1

the wallpaper of each screenshot can be found in **wallpapers** directory

this will my final rice before I change it for multi-monitor setup, 
small incremental changes will be done or maybe migarate to ewwii

## 🎹 Shortcut keys

here mod key is the windows key(the one with Windows logo) rest are same as default. 
since sway mostly uses shortcut keys from i3(which I love it's ease of use and keys making sense) 

`$mod + x` toggles dashboard

`$mod + p` toggles powermenu

`$mod + z` toggles bar

`$mod + g` kill eww daemon(if it crashes or spawns a zombie process)

`$mod + d` opens application launcher

`$mod + n` opens obsidian

## ❓ What are dotfiles?

Dotfiles are the customization files that are used to personalize your Linux or other Unix-based system. they are configurations for various applications. 

This repository contains my personal dotfiles. They are stored here for convenience so that I may quickly access them on new machines or new installs. Also, others may find some of my configurations helpful in customizing their own dotfiles. This config uses `sway` window manager as the source of it's configuration.


## 📦 How to install and set up my dotfiles?

my install script isn't perfect so only execute this if you know what you're doing,
this script only works if you're on arch linux!

- before cloning, install `git` and `base-devel`(for cloning and compiling AUR packages) if you haven't  
```
sudo pacman -Sy git base-devel
```
- Clone this repository with this command to avoid downloading history which has a big size 
```
git clone --depth=1 https://www.github.com/rellotscrewdriver/dotfiles.git && cd dotfiles
```
- run `sh install.sh`
- in the menu, select your choice
- disable your current login manager and then enable greetd to see the new login manager
```
sudo systemctl enable greetd.service
```
- restart and enjoy the fresh theme!

(optional) if you want the everblush theme in onlyoffice, make sure to install both GTK & Qt theme and enable system default in the theme settings 


Before leaving out and trying out my dotfiles, don't forget to **STAR** this repository! Thanks for checking out. 

***credits rolling***

## 🙏 Credits
- https://github.com/randomboi404/eww - main inspiration
- https://github.com/Firstp1ck/Hyprland-Simple-Setup
- https://github.com/mehedirm6244/Miserable_Xfce
- https://github.com/syndrizzle/hotfiles/tree/worm
- https://github.com/AlphaTechnolog/dotfiles/tree/openbox
- https://github.com/zDyant/HyprNova
and many more!