#Only for Arch based distros.


#[Update]: just run setup_new.sh file, it will automatically install vim, alacritty, urxvt terminal emulator

# vim
vim configuration file I wrote for compiling and executing C/C++ codes along with some visual customisations.

F5 to compile and execute C/C++/CUDA/Python files directly from vim.

Pre-Requisites : Copy the file compile.sh to ~/ folder.

1. create a new vimrc file, refer this answer -  https://stackoverflow.com/a/34005877
2. copy content
3. :source % --> from vim.

- For VimPlug, have to install git cli.

# C/C++/CUDA/Python Compilation Script.
Wrote it for less hassel in C++/C/Cuda/Python code compilation from vim.

[1] Manual Working : just execute as - 

./compile.sh <your program name>

  or 

bash compile.sh <your program name>

[2] Vim Working : add compile.sh to the '~/' or Home Directory and press F5 inside any C/C++/CUDA program opened in vim. 
  
Eg. bash compile.sh test.cpp

# Alacritty Terminal Configuration
Copy the .yml file contents to ~/.config/alacritty/alacritty.yml
Reload Alacritty.
