#installing
cp -r ranger dunst xfce4 "gtk-3.0" picom nvim btop polybar i3 fish lazygit rofi neofetch ~/.config
cp -r .xinitrc ~
cp -r icons ~/.local/share/icons/Synthwave/
cp -r wallpapers /
mkdir ~/.themes ~/.icons

#need to have curl
set -l _tide_tmp_dir (command mktemp -d)
curl https://codeload.github.com/ilancosman/tide/tar.gz/v5 | tar -xzC $_tide_tmp_dir
command cp -R $_tide_tmp_dir/*/{completions,conf.d,functions} $__fish_config_dir
fish_path=(status fish-path) exec $fish_path -C "emit _tide_init_install"

	gsettings set org.cinnamon.desktop.default-applications.terminal exec xfce4-terminal 

