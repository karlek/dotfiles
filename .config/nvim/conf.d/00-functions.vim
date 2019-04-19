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

let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction
