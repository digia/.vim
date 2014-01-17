syntax enable
filetype plugin indent on
set guifont=Ubuntu\ Mono\ for\ Powerline:h16
set antialias
set encoding=utf-8
set guioptions-=T
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set t_Co=256
set background=dark

"colorscheme monokai
"let g:monokai_termcolors=256
"let g:molokai_original=1
"highlight ColorColumn  ctermbg=235 guibg=#2c2d27
"highlight CursorLine   ctermbg=235 guibg=#2c2d27
"highlight CursorColumn ctermbg=235 guibg=#2c2d27

"let g:seoul256_background = 234
"colorscheme seoul256

"colorscheme xoria256

"colorscheme base16-default
"colorscheme base16-solarized
"let base16colorspace=256  " Access colors present in 256 colorspace

"colorscheme vividchalk

"let g:solarized_termcolors=256
colorscheme solarized

" highlight ColorColumn  guibg=#01242d
" highlight CursorLine   guibg=#01242d
" highlight CursorColumn guibg=#01242d

"highlight DiffText     gui=none
"highlight Macro        gui=none
"highlight SpecialKey   gui=none
"highlight Special      gui=none
"highlight StorageClass gui=none
"highlight Tag          gui=none

" Cursor styles 
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " Normal mode brick
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " Edit mode pipe

" Column colors
let &colorcolumn=join(range(81,999),",") " Join columns 81+ for warning color markers. 
let &colorcolumn="80,".join(range(120,999),",") " Join columns 120+ for danger color markers.
" call matchadd('ColorColumn', '\%81v', 100) " Only highlight the colors of lins that go over 80


