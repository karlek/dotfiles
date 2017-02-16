colorscheme evening " evening pride badwolf PaperColor
let g:airline_theme='badwolf'

fun! s:Bright()
      colorscheme PaperColor
      AirlineTheme silver
endf
command! Bright :call s:Bright()
