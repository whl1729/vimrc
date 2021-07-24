#!/bin/bash

apt_install() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 package bin"
        exit 1
    fi

    if [ "_$(which $2)" = "_" ]; then
        sudo apt-get install "$1"
    fi
}

pip_install() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 package"
        exit 1
    fi

    if [ "_$(which $1)" = "_" ]; then
        pip install "$1"
    fi
}

# install lint tools
if [ "_$(which mdl)" = "_" ]; then
    apt_install ruby-full ruby
    sudo gem install chef-utils -v 16.6.14
    sudo gem install mdl
fi

pip_install pylint

# install format tools
pip_install black
apt_install clang-format clang-format

# install other tools
apt_install silversearcher-ag ag

# install Vundle to manage vim plugins
vundle_dir="$HOME/.vim_runtime/my_plugins/Vundle.vim"
if [ ! -d "$vundle_dir" ]; then
    mkdir -p $vundle_dir
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
fi

# install vim plugins
vim -E +PluginInstall +qall

