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
" html
Plugin 'alvan/vim-closetag'
" general
Plugin 'dyng/ctrlsf.vim'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" cpp
Plugin 'rhysd/vim-clang-format'
" glsl
Plugin 'tikhomirov/vim-glsl'
" go
Plugin 'fatih/vim-go'
" js
Plugin 'ternjs/tern_for_vim'
" snippets
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => google vim-codefmt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"
