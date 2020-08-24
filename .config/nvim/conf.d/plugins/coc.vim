" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gP <Plug>(coc-codeaction)

" nmap <silent> <F2> <Plug>(coc-rename)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
" 	if (index(['vim','help'], &filetype) >= 0)
" 		execute 'h '.expand('<cword>')
" 	else
" 		call CocAction('doHover')
" 	endif
" endfunction

" " Remap for rename current word
" nmap <leader>R <Plug>(coc-rename)

" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
