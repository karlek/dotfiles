let mapleader="\<Space>"
let maplocalleader="\\"

" Disable command history search.
nnoremap q: <Nop>
" Disable help key.
nnoremap <F1> :echo<CR>
inoremap <F1> <Nop>

" Fast saving
nnoremap <leader>w :w!<cr>
" New buffer quick
nnoremap <leader>n :enew<CR>

" Change between two open files quickly
nnoremap <leader><leader> <C-^>

" Clear search highlighting.
nnoremap <silent> <leader>c :nohl<CR><cmd>lua vim.lsp.buf.clear_references()<CR>

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

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <leader>f <Plug>(easymotion-overwin-f)

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert empty line before or after cursor.
nnoremap <leader>O m`O<Esc>``
nnoremap <leader>o o<Esc>

" Switch buffers.
nnoremap <C-b> :Telescope buffers<cr>
" Search in files.
nnoremap <C-g> :Telescope live_grep<cr>
" Search for files.
nnoremap <C-p> :Telescope git_files<cr>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-s> :Telescope lsp_workspace_symbols<cr>
" nnoremap <C-p> :GFiles<cr>

" Smarter movement on wrapped lines.
nnoremap j gj
nnoremap k gk

" Toggle spell-check.
nnoremap <F3> :setlocal spell! spelllang=en,sv<CR>
" Remove trailing spaces.
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :echo "Whitespaced trimmed!" <CR>
" Toggle status bar.
nnoremap <F12> :call ToggleStatusBar()<CR>

" Swedish keyboard.
"
" Fix Swedish keyboard <C-[>
inoremap <F12> <esc>

" vvv Testing vvv
" nnoremap gF :Ag <C-r>=expand('<cword>')<cr><cr>
nnoremap <leader>b :ls<CR>:b<Space>

"nnoremap <silent><leader>vv :Goyo<cr>:Limelight!!<cr>:set list!<cr>:set linebreak!<cr>:set wrap!<cr>

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif



" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <F11> :ZenMode <CR>

nmap <leader>s :ClangdSwitchSourceHeader<cr>

" Remove unused autopairs keybindings.
let g:AutoPairsMoveCharacter = ""
" silent! iunmap <M-]>
" silent! iunmap <M-[>
