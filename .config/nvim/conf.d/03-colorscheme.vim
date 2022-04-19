syntax on

set background=dark
colorscheme badwolf
" let g:lightline = { "colorscheme": "darcula" }

" let ayucolor="light"  " for light version of theme
" set background=light
" colorscheme ayu
" let g:lightline = { "colorscheme": "one" }

" let ayucolor="mirage"  " for light version of theme
" set background=dark
" colorscheme ayu
" let g:lightline = { "colorscheme": "one" }

" set background=light
" colorscheme inspired-github
" let g:lightline = { "colorscheme": "one" }

" TODO
highlight Comment cterm=NONE gui=NONE
highlight SignatureMarkText guifg=#0f3f3f gui=bold
" Light theme
" highlight Todo guibg=#efdfaf
" Dark theme
highlight Todo guibg=#e03050

highlight clear SignColumn
highlight clear FoldColumn
set signcolumn=yes

" Light theme
" highlight IndentBlanklineChar guifg=#dddddd gui=nocombine

" Dark theme
highlight IndentBlanklineChar guifg=#444444 gui=nocombine

" Waiting for alacritty merge.
"" highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline
