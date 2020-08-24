"" --- Unsure ---
"" Filetype based syntax highlighting.
"filetype plugin indent on
"
"" Don't show mode in command-line, because we already show it in the
"" statusbar.
"" set noshowmode
"
"" Language settings
"let $LANG='en'
"set langmenu=en helplang=en
"
"" Move to file
"set wildignore=*.pyc
"
"" Indention is 4 spaces
"set shiftwidth=4
"set tabstop=4
"set softtabstop=4
"set smartindent
"set cindent
"
"" Show search count message when searching.
"set shortmess-=S
"
"" Automatically remove netrw buffers.
"augroup RemoveNetrwBuffers
"	autocmd!
"	autocmd FileType netrw setl bufhidden=delete
"augroup END
"
"" https://github.com/vim/vim/issues/2049
"set maxmempattern=5000
"
"" always show signcolumns
"set signcolumn=yes
