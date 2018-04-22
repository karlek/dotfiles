" Other great colorschemes:
" evening, pride, badwolf, PaperColor, hybrid

let g:dark_lightline = 'darcula'
let g:bright_lightline = 'PaperColor'
let g:bright_colorscheme = 'PaperColor'
let g:dark_colorscheme = 'PaperColor'
let g:lightline = {}

set background=dark
execute "colorscheme " . g:dark_colorscheme
let g:lightline.colorscheme = g:dark_lightline

function! s:ToggleBright()
      if &background == "dark"
            set background=light
            let g:lightline.colorscheme = g:bright_lightline
            execute "colorscheme " . g:bright_colorscheme
      else
            set background=dark
            let g:lightline.colorscheme = g:dark_lightline
            execute "colorscheme " . g:dark_colorscheme
      endif
      call lightline#init()
      call lightline#enable()
endfunction
command! ToggleBright :call s:ToggleBright()
