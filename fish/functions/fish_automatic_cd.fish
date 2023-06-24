function ranger-cd
    set dir (mktemp -t ranger_cd.XXX)
    ranger --choosedir=$dir
    cd (cat $dir) $argv
    rm $dir
    commandline -f repaint
end
funcsave ranger-cd

# To bind Ctrl-O to ranger-cd, save this in `~/.config/fish/config.fish`:
bind \co ranger-cd
