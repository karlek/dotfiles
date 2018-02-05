augroup start_deoplete
  autocmd!
  autocmd InsertEnter * call deoplete#enable()
                     \| autocmd! start_deoplete
augroup END
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

" Keep pum open for function signatures while in insert mode.
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
augroup ClosePum
  autocmd!
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
augroup END

" Rust settings
let g:deoplete#sources#rust = 'vim-racer'
let g:deoplete#sources#rust#racer_binary = $XDG_DATA_HOME.'/cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/lib/rustlib/src'
let g:deoplete#sources#rust#json_directory = $XDG_CACHE_HOME.'/nvim/deoplete/rust/cache.json'
let g:deoplete#sources#rust#use_cache = 1

" Go settings
let g:deoplete#sources#go = 'vim-go'
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = $XDG_CACHE_HOME.'/nvim/deoplete/go/cache.json'

" Prioritize language recommendations before buffers.
call deoplete#custom#set('go', 'rank', 1000)
call deoplete#custom#set('racer', 'rank', 1000)
call deoplete#custom#set('ns', 'rank', 1000)

" deoplete.nvim recommend, fixes deoplete lol. 
set completeopt+=noselect

function! s:tab_complete()
  " is there a snippet that can be expanded?
  " is there a placholder inside the snippet that can be jumped to?
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif

  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction

imap <silent><expr><TAB> <SID>tab_complete()

" for insert mode
inoremap <S-Tab> <C-p>
