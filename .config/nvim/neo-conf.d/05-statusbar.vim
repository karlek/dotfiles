let s:hidden_all = 0
function! ToggleStatusBar()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		" If in Insert, Replace or Visual mode put a message on the last line.
		set noshowmode
		" Don't show the line and column number of the cursor position, separated by
		" a comma.
		set noruler
		" The value of this option influences when the last window will have a
		" status line. 0 == never.
		set laststatus=0
	else
		let s:hidden_all = 0
		" The value of this option influences when the last window will have a
		" status line. 2 == always.
		set laststatus=2
	endif
endfunction

" Start vim with hidden statusbar.
call ToggleStatusBar()
