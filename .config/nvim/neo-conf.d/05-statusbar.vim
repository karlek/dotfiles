" Show command and selected characters in status line.
set showcmd

let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set laststatus=0
		" set noshowcmd
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction

" Start vim with hidden statusbar
call ToggleHiddenAll()
