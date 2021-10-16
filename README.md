# vim
vim configuration file I wrote for compiling and executing C/C++ codes along with some visual customisations.

F5 to compile and execute C/C++/CUDA/Python files directly from vim.

Pre-Requisites : Copy the file compile.sh to ~/ folder.

1. create a new vimrc file, refer this answer -  https://stackoverflow.com/a/34005877
2. copy content
3. :source % --> from vim.

- For VimPlug, have to install git cli.
- YouCompleteMe AutoCompleter used. [https://github.com/ycm-core/YouCompleteMe#installation]

# C/C++/CUDA/Python Compilation Script.
Wrote it for less hassel in C++/C/Cuda/Python code compilation from vim.

just execute as - 

./compile.sh <your program name>

  or 

bash compile.sh <your program name>

Eg. bash compile.sh test.cpp
