#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/vimrcs/my_configs.vim
source ~/.vim_runtime/vimrcs/my_plugins_configs.vim
catch
endtry' > ~/.vimrc

# initialize markdownlint configuration
echo "style \"$HOME/.vim_runtime/my_configs/mdlrc.rb\"" > ~/.mdlrc

# initialize Tern configuration
cp $HOME/.vim_runtime/my_configs/tern-project $HOME/.tern-project

# initialize js-beautify configuration
cp $HOME/.vim_runtime/my_configs/jsbeautifyrc $HOME/.jsbeautifyrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
