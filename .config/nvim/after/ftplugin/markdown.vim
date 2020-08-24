set nonumber
set textwidth=80
set nocursorline
set foldcolumn=3
" Prevent indentation for colons and parentheses. 
set nocindent

autocmd BufEnter * :syntax sync fromstart

let g:markdown_fenced_languages = ['javascript', 'json', 'proto', 'python', 'asn']
