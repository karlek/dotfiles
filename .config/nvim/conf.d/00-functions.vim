function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

function! Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    let l:root = ChompedSystem('git root')
    " echom l:root
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction
