function! FoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction

set foldtext=FoldText()

" Force folding.
" set foldmethod=indent
" set foldlevelstart=0

" Command to fold everything except what you searched for
command! -nargs=* Foldsearch
      \ if <q-args> != '' |
      \   exe "normal /".<q-args>."\<CR>" |
      \ endif |
      \ if @/ != '' |
      \   setlocal
      \     foldexpr=FoldRegex(v:lnum,@/,2)
      \     foldmethod=expr
      \     foldlevel=0 |
      \ endif
 
function! FoldRegex(lnum,pat,context)
  " get start/end positions for context lines
  let startline=a:lnum-a:context
  while startline < 1
    let startline+=1
  endwhile
  let endline=a:lnum+a:context
  while endline > line('$')
    let endline-=1
  endwhile
 
  let returnval = 2
 
  let pos=getpos('.')
 
  " search from current line to get matches ON the line
  call cursor(a:lnum, 1)
  let matchline=search(a:pat,'cW',endline)
  if matchline==a:lnum
    let returnval = 0
  elseif matchline > 0
    " if current line didn't match, there could have been a match within
    " trailing context lines
    let returnval = 1
  else
    " if no match at current line, search leading context lines for a match
    call cursor(startline, 1)
    let matchline=search(a:pat,'cW',a:lnum)
    if matchline > 0
      let returnval = 1
    endif
  endif
 
  call setpos('.',pos)
 
  return returnval
endfun

command! Inj Foldsearch \+\+\+
