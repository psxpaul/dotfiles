if has('macunix')
    map <M-w> :tabclose<CR>
    map <M-t> :tabnew<CR>
endif

"autocmd Filetype javascript,typescript,xml,html,xhtml setlocal foldmethod=syntax
autocmd Filetype * setlocal foldmethod=syntax
autocmd BufWinEnter * normal zR
