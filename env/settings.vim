" Digia .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
let mapleader=","
set hidden
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ttyfast   
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set showtabline=2
set winwidth=79
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store
" Fix slow O inserts
:set timeout timeoutlen=300 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1
" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=5
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" enable mouse for all modes settings
set mouse=a 
" Hide the mouse pointer while typing
set mousehide
"sync with OS clipboard
set clipboard=unnamed 
set number
" Make command line two lines high
set ch=2
" Don't update the display while executing macros
set lazyredraw
" Various characters are 'wider' than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into 'normal' width,
" which  sucks.  Setting it to double makes it awesome.
set ambiwidth=double
" Turn off the beeps!!!!!
set noerrorbells visualbell t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,javascript,sass,scss,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass,*.scss setfiletype sass 

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  " autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " *.md is markdown
  autocmd! BufNewFile,BufRead *.md setlocal ft=
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ %m%r%w\ %{fugitive#statusline()}\ [%{&ft}]\ %*\ %=\ R:%l/%L\ %*\ C:%03c\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap : ;
nmap <c-e> ;e#<cr>
nmap <silent> ,/ ;nohlsearch<CR>
set pastetoggle=<F2> " Paste mode toggle.

" Path to current files directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e ;edit %%
map <leader>v ;view %%

" Exit insert mode
inoremap kj <esc>

" Windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Align selected lines
vnoremap <leader>ib :!align<cr>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd ;lcd %:h<CR>

" Make the directory of the file in the buffer
nmap <silent> ,md ;!mkdir -p %:p:h<CR>

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" Redraw after the silent command is ran
command! -nargs=1 Silent
        \ | execute ':silent !'.<q-args>
        \ | execute ':redraw!'

" Reload the active chrome tab
nmap <leader>r ;Silent reload-chrome<cr>
nmap <leader>t ;w\|:Silent echo "phpunit %" > test-commands<cr> 
nmap <leader>ts ;w\|:Silent echo "phpunit" > test-commands<cr>
nmap <leader>s ;w\|:Silent echo "vendor/bin/phpspec run %" > test-commands<cr> 
nmap <leader>ss ;w\|:Silent echo "vendor/bin/phpspec run" > test-commands<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
map <leader>b ;CtrlPBuffer<CR>
map <leader>f ;CtrlP<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/vendor/**

" NerdTree
map <leader>n ;NERDTreeToggle<CR>

" Tagbar
nmap <F8> ;TagbarToggle<CR>

" Tablist
map <F4> ;TlistToggle<cr>
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_WinWidth = 50

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gremove<CR>

" Tabular
nmap <Leader>a& ;Tabularize /&<CR>
vmap <Leader>a& ;Tabularize /&<CR>
nmap <Leader>a= ;Tabularize /=<CR>
vmap <Leader>a= ;Tabularize /=<CR>
nmap <Leader>a: ;Tabularize /:<CR>
vmap <Leader>a: ;Tabularize /:<CR>
nmap <Leader>a:: ;Tabularize /:\zs<CR>
vmap <Leader>a:: ;Tabularize /:\zs<CR>
nmap <Leader>a, ;Tabularize /,<CR>
vmap <Leader>a, ;Tabularize /,<CR>
nmap <Leader>a<Bar> ;Tabularize /<Bar><CR>
vmap <Leader>a<Bar> ;Tabularize /<Bar><CR>

" vim-gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" VMap
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" python-mode
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_lint_ignore = "E501,W"

" syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['sass'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>m :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prepare a new PHP class
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add a new dependency to a PHP class
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
