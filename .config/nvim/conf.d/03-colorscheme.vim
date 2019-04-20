" Other great colorschemes:
" evening, pride, badwolf, PaperColor, hybrid

" Enable syntax highlighting.
syntax on

let g:dark_lightline = 'darcula'
let g:light_lightline = 'PaperColor'
let g:light_colorscheme = 'PaperColor'
let g:dark_colorscheme = 'badwolf'
let g:lightline = {}

set background=light
if &background ==? 'dark'
	execute 'colorscheme ' . g:dark_colorscheme
	let g:lightline.colorscheme = g:dark_lightline
else
	execute 'colorscheme ' . g:light_colorscheme
	let g:lightline.colorscheme = g:light_lightline
end

function! s:ToggleBright()
	if &background ==? 'dark'
		set background=light
		let g:lightline.colorscheme = g:light_lightline
		execute 'colorscheme ' . g:light_colorscheme
	else
		set background=dark
		let g:lightline.colorscheme = g:dark_lightline
		execute 'colorscheme ' . g:dark_colorscheme
	endif
	call lightline#init()
	call lightline#enable()
endfunction
command! ToggleBright :call s:ToggleBright()
