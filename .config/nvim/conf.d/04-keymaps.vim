let mapleader=" "
let maplocalleader="\\"

" Smarter movement on wrapped lines.
nnoremap j gj
nnoremap k gk

" Make Y behave consistently with other capitals
nnoremap Y y$

" Remap VIM 0 to first non-blank character
map 0 ^

" Disable command history search.
noremap q: <Nop>
" Disable help key.
noremap <F1> :echo<CR>
inoremap <F1> <Nop>

nnoremap <leader>O O<Esc>
nnoremap <leader>o o<Esc>
nnoremap <leader>1 :buffer 1<Esc>
nnoremap <leader>2 :buffer 2<Esc>
nnoremap <leader>3 :buffer 3<Esc>
nnoremap <leader>4 :buffer 4<Esc>
nnoremap <leader>5 :buffer 5<Esc>
nnoremap <leader>6 :buffer 6<Esc>
nnoremap <leader>7 :buffer 7<Esc>
nnoremap <leader>8 :buffer 8<Esc>
nnoremap <leader>9 :buffer 9<Esc>
nnoremap <leader>n :enew<cr>
nnoremap <leader>d :bp <BAR> bd #<CR>

" Special characters in regex are special. More perl like regular expressions.
nnoremap / /\v
vnoremap / /\v

" Fast sourcing
nnoremap <leader>r :source $MYVIMRC<CR>

" Fast saving
nnoremap <leader>w :w!<cr>

" Change between two open files quickly
nnoremap <leader><leader> <C-^>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Line motions
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <leader>f <Plug>(easymotion-overwin-f)

" Yank and paste to system clipboard.
vnoremap <leader>y  "+y
nnoremap <leader>y  "+y
nnoremap <leader>p "+p

nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

" Clear search highlighting.
nnoremap <silent> <leader>c :nohl<CR><C-l>

" Remove trailing spaces.
noremap <F3> :setlocal spell! spelllang=en,sv<CR>
noremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :echo "Whitespaced trimmed!" <CR>
noremap <F5> :UndotreeToggle<cr>

" Close help with `q`.
augroup CloseHelp
    autocmd!
    autocmd FileType help noremap <buffer> q :q<cr>
augroup END

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Little emacs never killed nobody.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Add forward-delete in insert mode.
inoremap <C-d> <C-o>de

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Switch buffers.
nnoremap <C-b> :CtrlPBuffer<cr>
inoremap <f12> <esc>

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Expand snippets and jump between insertion points.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

nnoremap <C-g> :Ggrep 
nnoremap gF :Ggrep <cword><cr>

nnoremap <S-h> :call ToggleHiddenAll()<CR>
