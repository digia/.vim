set nocompatible

filetype off " Vundle required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/env/bundles.vim
filetype plugin indent on     " Vundle required!

runtime macros/matchit.vim

source ~/.vim/env/functions.vim
source ~/.vim/env/settings.vim
source ~/.vim/env/auto_commands.vim
source ~/.vim/env/styles.vim
source ~/.vim/env/aliases.vim

" GoLang vim syntax
set rtp+=$GOROOT/misc/vim
