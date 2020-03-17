" Cmd-w and Cmd-t should close and open new tabs on OSX
if has('macunix')
    map <M-w> :tabclose<CR>
    map <M-t> :tabnew<CR>
    vmap <M-j> !~/bin/pretty<CR>
else
    map <C-w> :tabclose<CR>
    map <C-t> :tabnew<CR>
    vmap <C-j> !~/bin/pretty<CR>
endif

" Ctrl-Shift-PageUp and Ctrl-Shift-PageDown should move tabs left/right
noremap <C-S-PageUp> :tabm -1<CR>
noremap <C-S-PageDown> :tabm +1<CR>

set ignorecase                                              " case insensitive search by default
set smartcase                                               " case sensitive if you have any caps in your query
set nowrap                                                  " don't wrap long lines around
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'    " show line numbers in netrw/directory browser/explorer
set switchbuf=usetab,newtab                                 " navigating to quickfix entries should open in new tabs
au FocusGained * :checktime                                 " auto reload file changes when gaining focus

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"autocmd Filetype javascript,typescript,xml,html,xhtml setlocal foldmethod=syntax
"autocmd Filetype * setlocal foldmethod=syntax
"autocmd BufWinEnter * normal zR
