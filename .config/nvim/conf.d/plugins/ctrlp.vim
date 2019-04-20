" Match by filename.
let g:ctrlp_by_filename = 1

" Ignore vendor folders.
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v(vendor|node_modules|\.env)$',
\ }

" Only show files added to project.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
