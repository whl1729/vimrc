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
" general
Plugin 'dyng/ctrlsf.vim'
" cpp
Plugin 'rhysd/vim-clang-format'
" js
Plugin 'ternjs/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlsf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>f :CtrlSF<CR>
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => clang-format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup ClangFormatSettings
autocmd!
autocmd FileType c,cpp,objc,javascript nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,javascript vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END
