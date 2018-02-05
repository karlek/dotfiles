function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

" Record last position in file.
fun! LastPosition()
    " Ignore git commit messages.
    let name = fnamemodify( expand('%'), ':t:r' )
    if name =~ 'COMMIT_EDITMSG'
        return
    endif
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute "normal! g`\"" |
    endif
endfun

