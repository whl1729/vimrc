"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       whl1729 - wuhl6@mail2.sysu.edu.cn
"
" Important:
"       my plugins are managed by Vundle.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/my_plugins/Vundle.vim
" pass a path where Vundle should install plugins in the parenthese.
call vundle#begin('~/.vim_runtime/my_plugins')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
