"" --- Unsure ---

"" Make Y behave consistently with other capitals
"nnoremap Y y$
"nnoremap <leader>d :bp <BAR> bd #<CR>
 
"" Special characters in regex are special. More perl like regular expressions.
"nnoremap / /\v
"vnoremap / /\v

" " Figure out the system Python for Neovim.
" if exists('$VIRTUAL_ENV')
"     let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), "\n", '', 'g')
" else
"     let g:python3_host_prog=substitute(system('which python3'), "\n", '', 'g')
" endif

" set nrformats-=octal
