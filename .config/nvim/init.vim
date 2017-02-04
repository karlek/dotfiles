let g:_vimrc_base = '~/.config/nvim'
let g:_vimrc_sources = get(g:, '_vimrc_sources', {})

" Source all scripts in a directory
function! s:source(dir) abort
  " Only source files that have the `.vim` extension.
  for filename in sort(glob(g:_vimrc_base.'/'.a:dir.'/*.vim', 0, 1))
    if !has_key(g:_vimrc_sources, filename)
      let g:_vimrc_sources[filename] = 1
      execute 'source '.filename
    endif
  endfor
endfunction

call s:source('conf.d')

