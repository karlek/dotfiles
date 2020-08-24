let mapleader="\<Space>"
let maplocalleader="\\"

" Disable command history search.
nnoremap q: <Nop>
" Disable help key.
nnoremap <F1> :echo<CR>
inoremap <F1> <Nop>

" Fast sourcing
nnoremap <leader>r :source $MYVIMRC<CR>

" Fast saving
nnoremap <leader>w :w!<cr>

" Change between two open files quickly
nnoremap <leader><leader> <C-^>

" Clear search highlighting.
nnoremap <silent> <leader>c :nohl<CR><C-l>

" Fast window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Yank and paste to system clipboard.
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Line motions
nmap <leader>j <Plug>(easymotion-j)
vmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
vmap <leader>k <Plug>(easymotion-k)

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Switch buffers.
nnoremap <C-b> :CtrlPBuffer<cr>

nnoremap <leader>O O<Esc>
nnoremap <leader>o o<Esc>

" -- unsure --
"nnoremap <C-t> :CtrlPBufTagAll<cr>
"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"
"" Expand snippets and jump between insertion points.
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"
"nnoremap <silent> zj :call NextClosedFold('j')<cr>
"nnoremap <silent> zk :call NextClosedFold('k')<cr>
"function! NextClosedFold(dir)
"    let cmd = 'norm!z' . a:dir
"    let view = winsaveview()
"    let [l0, l, open] = [0, view.lnum, 1]
"    while l != l0 && open
"        exe cmd
"        let [l0, l] = [l, line('.')]
"        let open = foldclosed(l) < 0
"    endwhile
"    if open
"        call winrestview(view)
"    endif
"endfunction
"
"nnoremap <C-g> :Grep 
"nnoremap gF :execute("cgetexpr system(&grepprg . ' ' . expand('<cword>'))")<cr>
"
"" Smarter movement on wrapped lines.
"nnoremap j gj
"nnoremap k gk
"
"" Make Y behave consistently with other capitals
"nnoremap Y y$
nnoremap <leader>n :enew<CR>
"nnoremap <leader>d :bp <BAR> bd #<CR>
"
"" Special characters in regex are special. More perl like regular expressions.
"nnoremap / /\v
"vnoremap / /\v
"
"" Jump to anywhere you want with minimal keystrokes, with just one key
"" binding.
"" `s{char}{label}`
"nmap <leader>f <Plug>(easymotion-overwin-f)
"
"" Remove trailing spaces.
"nnoremap <F3> :setlocal spell! spelllang=en,sv<CR>
"nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :echo "Whitespaced trimmed!" <CR>
"nnoremap <F10> :UndotreeToggle<cr>
"nnoremap <F11> :TagbarToggle<cr>
"inoremap <F12> <esc>
"nnoremap <F12> :call ToggleHiddenAll()<CR>
"
"" Like '<C-r><C-w>' but for the line under the cursor.
"cnoremap <C-r><C-l> <C-r>=getline('.')<CR>
"
"" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)
"
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)
