function! ChompedSystem( ... )
	return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

" Redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd) abort
    let output = execute(a:cmd)
    vnew
	let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, split(output, "\n"))
endfunction
command! -nargs=1 Redir silent call Redir(<q-args>)
