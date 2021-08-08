""""""""""""""""""""""""""""""
" => C/C++ section
""""""""""""""""""""""""""""""
au FileType cpp setl shiftwidth=2 tabstop=2 expandtab
noremap <F5> :call Format()<CR>

function! Format()
    let file_extension = expand("%:e")
    let clang_files = ["c", "cc", "cpp"]
    let prettier_files = ["js", "md"]
    if index(clang_files, file_extension) >= 0
        cex system("clang-format -i ".expand("%:p"))
    elseif index(prettier_files, file_extension) >= 0
        cex system("prettier --no-semi --write ".expand("%:p"))
    elseif file_extension == "py"
        cex system("black ".expand("%:p"))
    endif

    edit
endfunction

""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""
" => Html section
"""""""""""""""""""""""""""""""
au FileType html setl shiftwidth=2 softtabstop=2 expandtab

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript setl shiftwidth=2 softtabstop=2 expandtab

au FileType javascript imap <C-t> $log();<esc>hi
au FileType javascript imap <C-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

au FileType javascript setl shiftwidth=2 softtabstop=2 expandtab

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => Markdown section
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

au FileType markdown setl shiftwidth=2 softtabstop=2 expandtab

" markdown 预览快捷键
noremap <F8> :!/usr/bin/google-chrome-stable %:p<CR>
noremap <F4> :call Lint()<CR>

function! Lint()
    let file_extension = expand("%:e")
    if file_extension == "md"
        cex system("mdl ".expand("%:p"))
    elseif file_extension == "js"
        cex system("eslint -f unix ".expand("%:p"))
    elseif file_extension == "py"
        cex system("pylint ".expand("%:p"))
    elseif file_extension == "sh"
        cex system("shellcheck -f gcc ".expand("%:p"))
    endif

    edit
endfunction

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
au FileType sh setl shiftwidth=2 softtabstop=2 expandtab

if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif

""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html

""""""""""""""""""""""""""""""
" => Yaml
""""""""""""""""""""""""""""""
au FileType yaml setl shiftwidth=2 softtabstop=2 expandtab
