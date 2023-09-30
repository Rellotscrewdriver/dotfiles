NVIM_CONFIG_DIR=~/.config/nvim
NVIM_LOCAL_DIR=~/.local/share/fonts/FiraCode/
NERD_FONT_DIR=~/tempFont/FiraCode.zip
set -e #terminate the script if anything errors out

echo -n "Copying config files to ~/.config/nvim"
mkdir -p $NVIM_CONFIG_DIR
cp -r lua snippets init.lua $NVIM_CONFIG_DIR 
echo "...done"

echo "Installing FiraCode nerd font in your local directory"
mkdir -p $NVIM_LOCAL_DIR
if [ -f $NERD_FONT_DIR ]; then
    echo "font's already there, skip installing it"
else
    echo "installing the required font from the internet, please wait if you do have internet connection"
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -O $NERD_FONT_DIR
fi
unzip -j $NERD_FONT_DIR -d $NVIM_LOCAL_DIR
fc-cache -f
rm -f $NERD_FONT_DIR

echo "Finished installing the config and the font!"
echo "make sure to restart the terminal to see the nerd icons"
