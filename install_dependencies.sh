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
        pip install "$1" -i "https://pypi.tuna.tsinghua.edu.cn/simple"
    fi
}

npm_install() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 package"
        exit 1
    fi

    if [ "_$(which $1)" = "_" ]; then
        npm install --global "$1"
    fi
}

install_linter() {
    if [ "_$(which mdl)" = "_" ]; then
        apt_install ruby-full ruby
        sudo gem install chef-utils -v 16.6.14
        sudo gem install mdl
    fi

    npm_install eslint
    pip_install pylint
}

install_formatter() {
    apt_install clang-format clang-format
    apt_install shellcheck shellcheck
    npm_install prettier
    pip_install black
}

install_autocompleter() {
    pip_install jedi
}

install_vundle() {
    vundle_dir="$plugin_dir/Vundle.vim"
    if [ ! -d "$vundle_dir" ]; then
        mkdir -p $vundle_dir
        git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
    fi
}

install_plugin() {
    vim -E +PluginInstall +qall
}

install_go_deps() {
    vim -E +GoInstallBinaries +qall
}

install_others() {
    apt_install silversearcher-ag ag

    # install js tools
    tern_dir="$plugin_dir/tern_for_vim"
    if [ ! -e "$tern_dir/node_modules/tern/bin/tern" ]; then
        cd $tern_dir
        npm install
    fi
}

plugin_dir="$HOME/.vim_runtime/my_plugins"

install_linter

install_formatter

install_autocompleter

install_vundle

install_plugin

install_go_deps

install_others

