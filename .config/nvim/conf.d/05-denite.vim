" Change file_rec command.
call denite#custom#var('file_rec', 'command',
            \ ['git', 'ls-files'])

" Change default prompt.
call denite#custom#option('default', 'prompt', '>')

" Change mappings.
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
