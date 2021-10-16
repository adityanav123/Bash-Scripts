# vim
vim configuration file I wrote for compiling and executing C/C++ codes along with some visual customisations.

F5 to compile and execute C/C++ files directly from vim.

1. create a new vimrc file, refer this answer -  https://stackoverflow.com/a/34005877
2. copy content
3. :source % --> from vim.

- For VimPlug, have to install git cli.

# C/C++/CUDA Compilation Script.
Wrote it for less hassel in C++/C/Cuda code compilation from vim.

just execute as - 
./compile.sh <your program name>
or 
bash compile.sh <your program name>
Eg. bash compile.sh test.cpp
