#!/bin/bash

echo "This setup is strictly for Arch-Based Distros."
echo
echo "This setup requires package 'git' to be installed."
cd ~/Downloads
echo "========================================================="
echo "Vim Installed? [1/0] : "
read vim_c
if [[ "$vim_c" == "0" ]]
then
    sudo pacman -S vim
fi
cp ./.vimrc ~/
echo "========================================================"

echo "Alacritty Installed? [1/0] : "
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

echo "======================================================="
cp ./compile.sh ~/


echo "Alacritty, Vim, Vim-Compilation Setup complete."

echo "For installing vim-plug, open .vimrc using vim and do :PlugInstall"
