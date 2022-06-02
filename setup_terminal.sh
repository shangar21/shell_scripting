#! /bin/bash

# shout out to navinn for his conifigs lol 
# https://github.com/navn-r

# run: sh terminal_setup.sh "apt install"

install=$1

sudo $install zsh
chsh -s /usr/bin/zsh
exec $SHELL
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config && touch ~/.config/starship.toml
curl -fsSL https://raw.githubusercontent.com/navn-r/dotfiles/master/starship.toml -o ~/.config/starship.toml
curl -fsSL https://raw.githubusercontent.com/navn-r/dotfiles/master/.zshrc -o ~/.zshrc
exec $SHELL
