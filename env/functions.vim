" Preserve
function! Preserve(command)
    " preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    execute a:command
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Strip Trailing Whitespace
function! StripTrailingWhitespace()
    call Preserve("%s/\\s\\+$//e")
endfunction

" Ensure Exists
function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction

" Close Window or Kill Buffer
function! CloseWindowOrKillBuffer()
    let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
    " never bdelete a nerd tree
    if matchstr(expand("%"), 'NERD') == 'NERD'
        wincmd c
        return
    endif
    if number_of_windows_to_this_buffer > 1
        wincmd c
    else
        bdelete
    endif
endfunction

" Rename a file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>


" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')
 
    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif
 
    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>


" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')
 
    let segments = split(namespace, '\')
    let typehint = segments[-1]
 
    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['
 
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap ,2  :call AddDependency()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"
" DOESN'T WORK WITH SNIPMATE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>
