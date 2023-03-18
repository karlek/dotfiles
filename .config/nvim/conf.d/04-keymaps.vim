let mapleader="\<Space>"
let maplocalleader="\\"

" Disable command history search.
nnoremap q: <Nop>
" Disable help key.
nnoremap <F1> <cmd>echo<CR>
inoremap <F1> <Nop>
nnoremap <F2> <cmd>echo @%<CR>
inoremap <F2> <cmd>echo @%<CR>

" Fast saving
nnoremap <leader>w <cmd>w!<cr>
" New buffer quick
nnoremap <leader>n <cmd>enew<CR>

" Change between two open files quickly
nnoremap <leader><leader> <C-^>

" Clear search highlighting.
nnoremap <silent> <leader>c <cmd>nohl<CR><cmd>lua vim.lsp.buf.clear_references()<CR>

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
nnoremap <leader>j <cmd>HopLineAC<CR>
vnoremap <leader>j <cmd>HopLineAC<CR>
nnoremap <leader>k <cmd>HopLineBC<CR>
vnoremap <leader>k <cmd>HopLineBC<CR>


nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>f  <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>r  <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <leader>t  <cmd>TroubleToggle<cr>
nnoremap ]n  <cmd>lua vim.diagnostic.goto_next()<cr>
nnoremap [n  <cmd>lua vim.diagnostic.goto_prev()<cr>

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nnoremap s <cmd>HopChar1<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert empty line before or after cursor.
nnoremap <leader>O m`O<Esc>``
nnoremap <leader>o o<Esc>

" Switch buffers.
nnoremap <C-b> <cmd>Telescope buffers<cr>
" Search in files.
" TODO: does not work with .git/info/exclude *
nnoremap <C-g> <cmd>Telescope live_grep<cr>
" Search for files.
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-s> <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

" Smarter movement on wrapped lines.
nnoremap j gj
nnoremap k gk

" Toggle spell-check.
nnoremap <F3> <cmd>setlocal spell! spelllang=en,sv<CR>
" Remove trailing spaces.
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :echo "Whitespaced trimmed!" <CR>
" Toggle status bar.
nnoremap <F12> <cmd>call ToggleStatusBar()<CR>

" Swedish keyboard.
"
" Fix Swedish keyboard <C-[>
inoremap <F12> <esc>

"nnoremap <silent><leader>vv :Goyo<cr>:Limelight!!<cr>:set list!<cr>:set linebreak!<cr>:set wrap!<cr>

au TermOpen * tnoremap <Esc> <c-\><c-n>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <F11> <cmd>ZenMode<cr><cmd>Twilight<cr>
" map <F11> <cmd>ZenMode<CR>

nmap <leader>s :ClangdSwitchSourceHeader<cr>

" Remove unused autopairs keybindings.
let g:AutoPairsMoveCharacter = ""
" silent! iunmap <M-]>
" silent! iunmap <M-[>

nmap gr ""<Plug>(ReplaceWithRegisterOperator)

command Bd bp | sp | bn | bd

nnoremap <silent><leader>i <Cmd>GoIfErr<CR>
nnoremap <silent><leader>s <Cmd>GoFillStruct<CR>
