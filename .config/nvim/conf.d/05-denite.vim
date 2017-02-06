" Change file_rec command.
call denite#custom#var('file_rec', 'command',
\ ['git', 'ls-files'])

nnoremap <silent> <C-p> :DeniteProjectDir file_rec<cr>
