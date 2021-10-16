#!/bin/bash
# C++/C/CUDA Compilation Script.

echo "[1]Compile Only     [2]Compile & Run:"
read choice
#echo "$choice"

filename=$1
fname="${filename%.*}"
#echo $fname

if [[ "${1: -4}" == ".cpp" ]]
then
    #echo "C++ File!"
    g++ -std=c++17 $filename -o $fname
    if [[ "$choice" == "2" ]]
    then
        ./$fname
        rm -rf $fname
    fi
fi

if [[ "${1: -3}" == ".cu" ]]
then
    #echo "CUDA File!"
    nvcc $filename -o $fname
    if [[ "$choice" == "2" ]]
    then
        ./$fname
        rm -rf $fname
    fi
fi

if [[ "${1: -2}" == ".c" ]]
then
    #echo "C File!"
    gcc $filename -o $fname
    if [[ "$choice" == "2" ]]
    then
        ./$fname
        rm -rf $fname
    fi
fi

