NVIM_CONFIG_DIR=~/.config/nvim
NVIM_LOCAL_DIR=~/.local/share/fonts 
NERD_FONT_DIR=~/DejaVuSansMono.zip

set -e #terminate the script if anything errors out

# check whether neovim is installed
if [[ -z "$(command -v nvim)" ]] && [[ ! -f "usr/bin/nvim" ]]; then
    echo "Please install neovim from your package manager"
fi

# check whether ripgrep is installed
if [[ -z "$(command -v rg)" ]] && [[ ! -f "usr/bin/rg" ]]; then
    echo "Please install ripgrep from your package manager"
fi

echo -n "Copying config files to ~/.config/nvim"
mkdir -p $NVIM_CONFIG_DIR
cp -r lua snippets init.lua $NVIM_CONFIG_DIR 
echo "...done"

echo "Installing hack nerd font in your local directory"
mkdir -p $NVIM_LOCAL_DIR
if [ -f "~/DejaVuSansMono.zip" ]; then
    echo "font's already there, skip installing it"
else
    echo "installing the required font from the internet, please wait if you do have internet connection"
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/DejaVuSansMono.zip -O $NERD_FONT_DIR
fi

unzip -j $NERD_FONT_DIR "DejaVu Sans Mono Nerd Font Complete.ttf" -d $NVIM_LOCAL_DIR
fc-cache -f
rm -f $NERD_FONT_DIR

echo "Finished installing the config and the font!"
echo "make sure to restart the terminal to see the nerd icons"