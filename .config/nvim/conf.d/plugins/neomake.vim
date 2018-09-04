" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:neomake_error_sign = {
   \   'text': 'x',
   \   'texthl': 'NeomakeErrorSign',
   \ }
let g:neomake_warning_sign = {
   \   'text': '!',
   \   'texthl': 'NeomakeWarningSign',
   \ }
let g:neomake_message_sign = {
   \   'text': '.',
   \   'texthl': 'NeomakeMessageSign',
   \ }
let g:neomake_info_sign = {
   \ 'text': 'i',
   \ 'texthl': 'NeomakeInfoSign',
   \ }

let g:neomake_go_enabled_makers = ['go']
let g:neomake_go_go_remove_invalid_entries = 1
