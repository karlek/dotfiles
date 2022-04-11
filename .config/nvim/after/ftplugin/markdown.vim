setlocal nonumber
setlocal textwidth=80
setlocal nocursorline
" setlocal foldcolumn=3

" Prevent indentation for colons and parentheses. 
" set nocindent

" autocmd BufEnter * :syntax sync fromstart

let g:markdown_fenced_languages = ['javascript', 'json', 'proto', 'python', 'asn']

inoremap <silent> <buffer> ! !<C-g>u
inoremap <silent> <buffer> , ,<C-g>u
inoremap <silent> <buffer> . .<C-g>u
inoremap <silent> <buffer> : :<C-g>u
inoremap <silent> <buffer> ; ;<C-g>u
inoremap <silent> <buffer> ? ?<C-g>u
inoremap <silent> <buffer> ( <C-g>u(
inoremap <silent> <buffer> ) )<C-g>u
inoremap <silent> <buffer> <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
