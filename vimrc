syntax enable
set encoding=utf-8
set nocompatible
set nowrap
set autochdir
set number
set incsearch
set hlsearch
map <F11> :set invpaste<CR>
set tags=~/.tags
set complete=.,w,b,u,t,i
set wildmode=longest:full,list
set wildmenu
set backspace=indent,eol,start

set ignorecase
set smartcase

" invisible characters				  asdfasfd
set list
set listchars=tab:▸\.,trail:-,extends:»,precedes:«
" set listchars+=,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" indentation stuff
set filetype=on
filetype plugin on
filetype indent on
set ai
set ts=4
set sts=4
set et
set sw=4

" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2

" autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" turn off jslint for cli vim
if !has('gui_running')
    let g:JSLintHighlightErrorLine = 0
endif

" relative line numbers
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc
nnoremap <C-L> :call g:ToggleNuMode()<cr>
" nnoremap <C-L> :set nornu!<cr>

set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore=*/tmp/*,*.so,*.class,*.swp,*.zip,*.pdf,*.o,*/target/*
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_regexp = 1
let g:ctrlp_root_markers = ['pom.xml', 'Gruntfile.js', 'package.json']

set laststatus=2
set statusline=%F%m%r%h%w\ %=%<%1.30{getcwd()}\ [line\ %l\/%L\ \|\ col\ %v]

hi StatusLine ctermfg=Black ctermbg=White guifg=Black guibg=White
au InsertEnter * hi StatusLine ctermbg=DarkBlue guibg=DarkBlue
au InsertLeave * hi StatusLine ctermfg=Black ctermbg=White guifg=Black guibg=White
" hi Normal guibg=black guifg=white
:color twilight
set guifont=Monaco\ 10
