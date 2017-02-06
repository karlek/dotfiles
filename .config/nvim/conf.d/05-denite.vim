" Change file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['ag', '--hidden', '--nocolor', '--nogroup', '-g', ''])

" nnoremap <silent> <C-p> :DeniteProjectDir file_rec<cr>
nnoremap <silent> <C-p> :Denite file_rec<cr>
