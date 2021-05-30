#!/bin/bash

# install tools needed by vim plugins
sudo apt install silversearcher-ag
sudo apt install clang-format

# install Vundle to manage vim plugins
vundle_dir="$HOME/.vim_runtime/my_plugins/Vundle.vim"
if [ ! -d "$vundle_dir" ]; then
    mkdir -p $vundle_dir
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
fi

# install vim plugins
vim -E +PluginInstall +qall

