#!/usr/bin/env fish
if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    sudo pacman -Syu --noconfirm fd bat lsd fasd
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    curl https://raw.githubusercontent.com/reisub0/dot/master/.config/fish/fishfile -o ~/.config/fish/fishfile
    fish -c fisher
end
bax source $HOME/.bash_profile
cd $HOME
