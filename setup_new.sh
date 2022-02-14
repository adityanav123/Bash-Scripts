#!/bin/bash
# echo "hello world"
touch temp.txt

installationProcedure() {
    dialog --title "Installation Dot Files" --textbox ./programs_to_install.txt 20 60
    clear
    dialog --pause "pause" 20 40 30
    clear
    clear
}

installProgram() {
    program=$1
    dialog --infobox "installing $program" 3 40 ; sleep 1
    clear
    #testing the presence of file.
    touch temporary.txt
    command -v $program > temporary.txt
    if [[ -s  ./temporary.txt ]]
    then
        dialog --infobox "file present!" 3 40 ; sleep 1
    else
        dialog --title "file not present" --menu "do you want to install $program?" 12 45 25 1 'yes' 2 'no' 2>temporary.txt
        t=$(cat temporary.txt)
        if [[ "$t" == "1" ]]
        then
            clear
            sudo pacman -S $program
        fi
    fi
    rm -rf temporary.txt
    clear
}

installationProcedure

installProgram vim
installProgram alacritty
installProgram rxvt-unicode

# copying files
dialog --pause "copying vimrc and vim-compilation files.." 3 40 2 
cp ./.vimrc ~/.
cp ./compile.sh ~/.

#vim-plug install
dialog --infobox "installing vim-plug for vim-plugins" 3 40 ; sleep 1
clear
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
clear

dialog --msgbox  "Installation of all the components successful!" 10 25


rm -rf temp.txt
