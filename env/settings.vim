set shell=bash
set noesckeys

set ttimeout
set ttimeoutlen=50 " Don't wait so long for the next keypress (particularly in ambigious Leader situations.
set timeoutlen=300

set mouse=a " enable mouse for all modes settings

" Hide the mouse pointer while typing
set mousehide

set clipboard=unnamed "sync with OS clipboard
set showmode
set nrformats-=octal "always assume decimal numbers

set tags=tag
set showfulltag

set modeline
set modelines=5

set hidden
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
set encoding=utf-8 
set history=1000
set undolevels=1000
set backspace=indent,eol,start
set expandtab
set autoindent
set copyindent
set smartindent
set smarttab
set shiftround

set linebreak
let &showbreak='↪ '

" When the page starts to scroll, keep the cursor 4 lines from the top and 4
" lines from the bottom
set scrolloff=4

set display+=lastline

set wildmenu                                        "show list for autocomplete
set wildmode=list:full
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store

set splitbelow
set splitright
set noerrorbells
set novisualbell
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter

nmap <silent> ,/ ;nohlsearch<CR>

if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
endif
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif
if exists('+undofile')
    set undofile
    set undodir=~/.vim/.cache/undo
endif

set backup
set backupdir=~/.vim/.cache/backup
set directory=~/.vim/.cache/swap
" set noswapfile

call EnsureExists('~/.vim/.cache')
call EnsureExists(&undodir)
call EnsureExists(&backupdir)

set wrap
set title
set number
set ruler
set tabstop=4
set shiftwidth=4
set showmatch
set cursorline
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
au BufRead,BufNewFile *.md,*.markdown,*.mdown,*.mkd,*.mkdn,README.md set filetype=markdown
au BufRead,BufNewFile *.pp,*.puppet set filetype=puppet
au BufRead,BufNewFile *.go set filetype=go
set tags=tags

" Make command line two lines high
set ch=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command int he lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Automatically read a file that has changed on disk
set autoread

" Various characters are 'wider' than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into 'normal' width,
" which  sucks.  Setting it to double makes it awesome.
set ambiwidth=double

" Turn off the beeps!!!!!
set noerrorbells visualbell t_vb=
