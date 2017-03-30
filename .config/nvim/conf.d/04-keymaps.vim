nmap <leader>O O<Esc>
nmap <leader>o o<Esc>
nmap <leader>1 :buffer 1<Esc>
nmap <leader>2 :buffer 2<Esc>
nmap <leader>3 :buffer 3<Esc>
nmap <leader>4 :buffer 4<Esc>
nmap <leader>5 :buffer 5<Esc>
nmap <leader>6 :buffer 6<Esc>
nmap <leader>7 :buffer 7<Esc>
nmap <leader>8 :buffer 8<Esc>
nmap <leader>9 :buffer 9<Esc>
nmap <C-PageUp> :bprev<cr>
nmap <C-PageDown> :bnext<cr>
nmap <leader>n :enew<cr>
nmap <leader>d :bp <BAR> bd #<CR>

" Fast sourcing
map <leader>r :source $MYVIMRC<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Change between two open files quickly
nnoremap <leader><leader> :e#<CR>

" Change between two open files quickly
nnoremap <leader>q :wq!<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Yank and paste to system clipboard.
vnoremap <leader>y  "+y
nnoremap <leader>p "+p

nmap <Leader>/ :Commentary<cr>
vmap <Leader>/ :Commentary<cr>

" Clear search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" Smarter movement on wrapped lines.
nnoremap j gj
nnoremap k gk

" Disable command history search.
map q: <Nop>
" Disable help key.
nmap <F1> :echo<CR>

" Remove trailing spaces.
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
map <F3> :setlocal spell! spelllang=en_us<CR>
nnoremap <F5> :UndotreeToggle<cr>
nmap <F8> :TagbarToggle<CR>

" Close help with `q`.
autocmd FileType help noremap <buffer> q :q<cr>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Make Y behave consistently with other capitals
map Y y$

" Little emacs never killed nobody.
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Buffer, file and line searching.
nnoremap <silent> <C-b> :DeniteProjectDir buffer<cr>
nnoremap <silent> <C-p> :DeniteProjectDir file_rec<cr>
nnoremap <silent> <C-g> :Grepper<cr>

" Add forward-delete in insert mode.
inoremap <C-d> <C-o>de
