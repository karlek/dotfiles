onoremap <SID>line :normal! ^vg_<CR>
nmap <silent> saa <Plug>(operator-sandwich-add)<SID>line

call operator#sandwich#set('all', 'all', 'highlight', 0)
