" functions {{{

  function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
  endfunction "}}}

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
" }}}
