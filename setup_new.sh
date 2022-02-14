#!/bin/bash
# echo "hello world"
#dialog --pause "Checking for Internet Connectivity" 20 40 2
echo "checking for internet connectivity.."
echo
touch internet_connectivity.txt
curl -Is google.in | head -n 1 > internet_connectivity.txt
if [[ -s ./internet_connectivity.txt ]]
then
    echo "-->connected to net."
else
    echo "-->not connected, connect to internet and try again."
    exit
fi
rm -rf internet_connectivity.txt

echo "check for gui-compatibility"
touch temp.txt
command -v dialog > temp.txt
if [[ -s ./temp.txt ]]
then
    echo
   echo "-->gui compatibility present!"
else
  sudo pacman -S dialog  
fi
echo
echo "press enter to continue"
read s

# flags for programs
vim_flag=0
alacritty_flag=0
urxvt_flag=0


installationProcedure() {
    dialog --title "Installation Dot Files" --textbox ./programs_to_install.txt 20 60
    #dialog --title "Installing dot files" --menu "Programs present to install"
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
        dialog --infobox "$program already present!" 3 40 ; sleep 1
        if [[ "$program" == "vim" ]]
        then
            vim_flag=1
        fi

        if [[ "$program" == "alacritty" ]]
        then
            alacritty_flag=1
        fi
        
        if [[ "$program" == "rxvt-unicode" ]]
        then
            urxvt_flag=1
        fi
    
    else
        dialog --title "$program not present" --menu "do you want to install $program?" 12 45 25 1 'yes' 2 'no' 2>temporary.txt
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

if [[ -s rxvt-unicode ]]
then
    dialog --infobox "copying .Xresources file for rxvt-unicode terminal emulator" 3 50 ; sleep 1
    cp .Xresources ~/
fi

if [[ -s alacritty ]]
then
    dialog --infobox "copying configuration files for alacritty" 3 50 ; sleep 1
    mkdir ~/.config/alcritty/
    cp alacritty.yml ~/.config/alacritty/.
fi

# copying files
if [[ "$vim_flag" == "0" ]]
then
    dialog --infobox "copying vimrc and vim-compilation files.." 3 40 ; sleep 1 
    cp ./.vimrc ~/.
    cp ./compile.sh ~/.


    #vim-plug install
    dialog --infobox "installing vim-plug for vim-plugins" 3 40 ; sleep 1
    clear
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    clear
fi

dialog --msgbox  "Installation of all the components: Successful!" 10 40

clear
rm -rf temp.txt
