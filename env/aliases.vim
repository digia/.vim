let mapleader=","
let g:mapleader = ","

set pastetoggle=<F2> " Paste mode toggle.

" Copy paste
vmap <leader>c ;w !pbcopy<cr><cr>

" Directory: ---
" Path to current files directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e ;edit %%
map <leader>v ;view %%

" Navigation: ---
nnoremap j gj
nnoremap k gk
nnoremap ; :
nnoremap : ;

" Mode Switching: ---
inoremap jj <esc>

" Buffers: ---
nmap <c-e> ;e#<cr>

" Split Windows: ---
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Airline Status Bar:
"    let g:airline_powerline_fonts = 1
"    let g:bufferline_echo = 0 " Don't display the bufferline with airline
"    let g:airline_detect_whitespace = 0 " Don't detect the whitespace

" Powerline Status Bar:
" Testing not using powerline 2014-1-1
" set rtp+=~/opt/powerline/powerline/bindings/vim 

" PDV: - PHP Documentor for VIM
    " let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
    " nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
    
" CTRLP: ---
map <leader>b ;CtrlPBuffer<CR>
map <leader>f ;CtrlP<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/vendor/**

" NerdTree: ---
map <leader>n ;NERDTreeToggle<CR>

" Tagbar: --- 
    nmap <F8> ;TagbarToggle<CR>
    
" Tablist: ---
    map <F4> ;TlistToggle<cr>
    let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
    let Tlist_WinWidth = 50
    
" Fugitive: ---
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>gr :Gremove<CR>

" Tabular: ---
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

" Tidy: ---
    map :tidy :%!tidy -qicbn -asxhtml

" QuickTask: ---
    let g:quicktask_snip_path = '~/.vim/snips'

" ListTrans: ---
nmap  ;l   :call ListTrans_toggle_format()<CR>
vmap  ;l   :call ListTrans_toggle_format('visual')<CR>

" VMap: ---
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" DragVisual: ---
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Toggle paste mode
nmap <silent> ,p ;set invpaste<CR>;set paste?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> ,cd ;lcd %:h<CR>
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
