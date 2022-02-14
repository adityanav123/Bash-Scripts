#!/bin/bash
# C++/C/CUDA Compilation Script.

filename=$1
fname="${filename%.*}"
#echo $fname

if [[ "${1: -3}" == ".py" ]]
then
    dialog --infobox "$filename Execute.." 3 70 ; sleep 1
    clear
    python $filename
    exit
fi

if [[ "${1: -3}" == ".sh" ]]
then
    dialog --infobox "$filename Shell Script Execute.." 3 70 ; sleep 1
    clear
    bash $filename
    exit
fi

touch temp.txt # deleted at the end
dialog --menu 'Choose:' 12 45 25 1 'Compile Only' 2 'Compile & Run' 3 'Debug' 2>temp.txt

choice=$(cat temp.txt)
clear

#echo "[1]Compile Only     [2]Compile & Run      [3]Debug Mode"
#read choice
#echo "$choice"

echo 
if [[ "${1: -4}" == ".cpp" ]]
then
    if [[ "$choice" == "1" ]]
    then
        dialog --infobox "Compiling $filename" 3 70 ; sleep 1
        clear
        g++ -std=c++17 $filename -Wall -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        if [ ! -f $fname ]
        then
            dialog --infobox "$fname.out not found, compiling." 3 70 ; sleep 1
            g++ -std=c++17 $filename -o $fname
        fi
        clear
        dialog --infobox "Running $fname.out.." 3 70 ; sleep 1
        clear 
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        dialog --infobox "GDB Debugger Start.." 3 70 ; sleep 2
        clear
        g++ -std=c++17 -w -g $filename -o $fname
        gdb ./$fname
        rm -rf $fname
    fi
fi

if [[ "${1: -3}" == ".cu" ]]
then
    if [[ "$choice" == "1" ]]
    then
        dialog --infobox "Compiling $filename.." 3 70 ; sleep 1
        clear
        nvcc -arch=sm_75 -rdc=true $filename -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        if [ ! -f $fname ]
        then
            dialog --infobox "$fname.out not found, Compiling $filename.." 3 70 ; sleep 1
            nvcc -arch=sm_75 -rdc=true $filename -o $fname
        fi
        clear 
        dialog --infobox "Running $fname.out.." 3 70 ; sleep 1
        clear
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        dialog --infobox "CUDA-GDB Debugger Start.." 3 70 ; sleep 3
        clear
        nvcc -arch=sm_75 -g -G -rdc=true $filename -o $fname
        cuda-gdb ./$fname
        rm -rf $fname
    fi
fi

if [[ "${1: -2}" == ".c" ]]
then
    if [[ "$choice" == "1" ]]
    then
        dialog --infobox "Compiling $filename.." 3 70 ; sleep 1
        clear
        gcc $filename -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        if [ ! -f $fname ]
        then
            dialog --infobox "$fname.out not found, Compiling $filename.." 3 70 ; sleep 1
            clear
            gcc $filename -o $fname
        fi
        dialog --infobox "Running $fname.out.." 3 70 ; sleep 1
        clear
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        dialog --infobox "GDB Debugger Start.." 3 70 ; sleep 2
        clear
        gcc -g -w $filename -o $fname
        gdb ./$fname
        rm -rf $fname
    fi
fi

# deleting the temp file after completion
rm -rf temp.txt


