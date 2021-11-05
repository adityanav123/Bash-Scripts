#!/bin/bash
# C++/C/CUDA Compilation Script.

filename=$1
fname="${filename%.*}"
#echo $fname

if [[ "${1: -3}" == ".py" ]]
then
    python $filename
    exit
fi

echo "[1]Compile Only     [2]Compile & Run      [3]Debug Mode"
read choice
#echo "$choice"


if [[ "${1: -4}" == ".cpp" ]]
then
    if [[ "$choice" == "1" ]]
    then
        g++ -std=c++17 $filename -Wall -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        g++ -std=c++17 $filename -o $fname
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        g++ -std=c++17 -w -g $filename -o $fname
        gdb ./$fname
        rm -rf $fname
    fi
fi

if [[ "${1: -3}" == ".cu" ]]
then
    if [[ "$choice" == "1" ]]
    then
        nvcc $filename -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        nvcc $filename -o $fname
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        nvcc -g -G $filename -o $fname
        cuda-gdb ./$fname
        rm -rf ./$fname
    fi
fi

if [[ "${1: -2}" == ".c" ]]
then
    if [[ "$choice" == "1" ]]
    then
        gcc $filename -o $fname
    fi

    if [[ "$choice" == "2" ]]
    then
        gcc $filename -o $fname
        ./$fname
        rm -rf $fname
    fi

    if [[ "$choice" == "3" ]]
    then
        gcc -g -w $filename -o $fname
        gdb ./$fname
        rm -rf $fname
    fi
fi


