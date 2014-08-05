syntax enable
filetype plugin indent on
set guifont=Ubuntu\ Mono:h16
set antialias
set encoding=utf-8
set guioptions-=T
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set t_Co=256
set background=dark

"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
colorscheme solarized

" Cursor styles 
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " Normal mode brick
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " Edit mode pipe

" Column colors
let &colorcolumn=join(range(81,999),",") " Join columns 81+ for warning color markers. 
let &colorcolumn="80,".join(range(120,999),",") " Join columns 120+ for danger color markers.
