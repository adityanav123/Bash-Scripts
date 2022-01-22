#!/bin/bash

echo "This setup is strictly for Arch-Based Distros."
echo
echo "This setup requires package 'git' to be installed."
cd ~/Downloads

git clone https://github.com/adityanav123/Bash-Scripts.git
cd ./Bash-Scripts

sudo pacman -S vim
cp ./.vimrc ~/

echo "Terminal Alacritty Installed? [1/0] : "
read choice

if [[ "$choice" == "1" ]]
then
    mkdir ~/.config/alacritty
    cp ./alacritty.yml ~/.config/alacritty/
else
    sudo pacman -S alacritty
    mkdir ~/.config/alacritty
    cp ./alacritty.yml ~/.config/alacritty
fi

# Installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cp ./compile.sh ~/


echo "Alacritty, Vim, Vim-Compilation Setup complete."

