#!/bin/bash

install() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 package bin"
        exit 1
    fi

    if [ "_$(which $2)" = "_" ]; then
        sudo apt-get install "$1"
    fi
}

# install tools needed by vim plugins
install silversearcher-ag ag
install clang-format clang-format
install ruby-full ruby

# install markdown lint
if [ "_$(which mdl)" = "_" ]; then
    sudo gem install chef-utils -v 16.6.14
    sudo gem install mdl
fi

# install Vundle to manage vim plugins
vundle_dir="$HOME/.vim_runtime/my_plugins/Vundle.vim"
if [ ! -d "$vundle_dir" ]; then
    mkdir -p $vundle_dir
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
fi

# install vim plugins
vim -E +PluginInstall +qall

