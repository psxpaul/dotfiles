set lines=40 columns=150

vmap <C-j> !~/bin/pretty<CR>
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

noremap <C-z> :undo<CR>
noremap <C-y> :redo<CR>
noremap <C-t> :tabnew<CR>
inoremap <C-Space> <C-x><C-o>

set showtabline=2 " always show tabs

" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[New Document]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  return label . name
endfunction
set guitablabel=%{GuiTabLabel()}

set switchbuf=newtab

" cmd+# should jumpt to the tab on Mac
if has('gui_macvim')
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 1gtgT
endif
