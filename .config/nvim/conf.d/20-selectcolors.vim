fun! s:SelectColorS()
	exec 'DimInactiveOff'
	50vnew
	setlocal bufhidden=wipe buftype=nofile nonu fdc=0
	file ColorSchemeSelector
	let files = split(glob(expand('~/.local/share/nvim/plugged/vim-colorschemes/colors/').'*'))
	for file in files
		let name = fnamemodify( file, ':t:r' )
		if strlen(name) > 0
			put=name
		endif
	endfor
	normal ggdd
	setlocal nomodifiable
	setlocal cursorline
	hi CursorLine gui=reverse
	nmap <buffer>  <cr>  :exec 'colorscheme ' . getline('.')<CR>
	nmap <buffer>  q     :exec 'DimInactiveOn' <bar> quit<CR>
endf
com! SelectColorS :cal s:SelectColorS()

