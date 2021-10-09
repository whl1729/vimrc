"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       whl1729 - wuhl6@mail2.sysu.edu.cn
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/whl1729/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast quit
nmap <leader>q :q<cr>
nmap <Leader>wq :wa<CR>:qa<CR>
nmap <Leader>Q :qa!<CR>
nmap <Leader>t :g/^$/d<CR>
" Move Right (Youyi, 右移) and Quote until Blank
nmap <Leader>yb :s/\(^[^ ]*\)/  - `\1`/<CR>
" Move Right (Youyi, 右移) and Quote until Uppercase letter
nmap <Leader>yu :s/\(^[^A-Z]*\) /  - `\1` /<CR>
" Move Right (Youyi, 右移) and add Hyphen
nmap <Leader>yh :s/^/  - /<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line number
set number
