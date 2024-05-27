setlocal bufhidden=delete

if !exists("*s:BDeleteNetrw")
	function! s:BDeleteNetrw()
		for i in range(bufnr('$'), 1, -1)
			if buflisted(i)
				if getbufvar(i, 'netrw_browser_active') == 1
					silent exe 'bdelete ' . i
				endif
			endif
		endfor
	endfunction
endif

augroup netrw_buffergator
	autocmd! * <buffer>
	autocmd BufLeave <buffer> call s:BDeleteNetrw()
augroup END

" Remove netrw banner.
let g:netrw_banner = 0
" Save directory for `.netrwbook` and `.netrwhist`.
let g:netrw_home=$XDG_DATA_HOME.'/nvim'
" Return to last edited file with <C-^>.
let g:netrw_altfile = 1
