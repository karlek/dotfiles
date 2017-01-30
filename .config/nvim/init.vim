" To ignore plugin indent changes, instead use:
"filetype plugin on

set nocompatible              " be iMproved, required
filetype off                  " required

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

call plug#begin('~/.local/share/nvim/plugged')

"Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

" Completion for go
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neopairs.vim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Colorscheme pack
Plug 'flazz/vim-colorschemes'

" Css colors
Plug 'ap/vim-css-color'

" Undo tree
Plug 'mbbill/undotree'

" Diff on recover
Plug 'chrisbra/Recover.vim'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Tagbar
Plug 'majutsushi/tagbar'

" Easy motion (vimfx)
Plug 'easymotion/vim-easymotion'

" zen-mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

" Auto formatting.
"Plug 'Chiel92/vim-autoformat'

" Live reload.
Plug 'jaxbot/browserlink.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Dim inactive pane/window
Plug 'blueyed/vim-diminactive'

" Colorscheme badwolf
Plug 'sjl/badwolf'

" Change surrounding characters
Plug 'tpope/vim-surround'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Golang support
Plug 'fatih/vim-go'

" Language support
Plug 'sheerun/vim-polyglot'

" Fish support
"Plug 'dag/vim-fish'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LaTeX handling.
Plug 'lervag/vimtex'

" Multiple cursors (C-n)
Plug 'terryma/vim-multiple-cursors'

call plug#end()            " required

"
""" Normal config
"

" Filetype based syntax highlighting.
filetype plugin indent on    

" Enable syntax highlighting.
syntax on

" Syntax highlighting is slow with long lines.
"set synmaxcol=200

colorscheme pride

" Automatically reload file if changed by envrionment.
set autoread

set termencoding=utf-8 encoding=utf-8 fileformat=unix

" Hides buffers instead of forcing them to close.
set hidden

" Language settings
let $LANG='en'
set langmenu=en helplang=en

" Line numbering
set number

" Show matching paranthesis.
set showmatch

" Move swap files to a collected directory
set directory=~/.config/nvim/swap
set backupdir=~/.config/nvim/swap
set undodir=~/.config/nvim/swap

let mapleader=" "
let maplocalleader="\\"

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

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
nnoremap <leader>t :CtrlP<cr>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

"nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" Recognize .md filenames as markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Explicitly state encoding and file-endings.
set encoding=utf8
set ffs=unix,dos,mac

" Enables mouse scrolling 
set mouse=a

" Visual autocomplete for command menu
set wildmenu 
set wildmode=list:longest,full

" Add a bit extra margin to the left
set foldcolumn=1

" Start searching automatically when typing
set incsearch 

" Ignore case when searching
set ignorecase
set smartcase

" Allow switching of buffers without saving them first
set hidden 

" Highlight line but not column
set cursorline nocursorcolumn 

" Word wrap
set wrap linebreak 

" Show as much as possible of the last line
set display=lastline 

" Minimum number of lines surrounding cursor
set scrolloff=3 

" Disable help key
nmap <F1> :echo<CR>

" Indention is 4 spaces
set shiftwidth=4
set smartindent
set cindent
set tabstop=4
set softtabstop=4

" Keep more info in memory, commands etc. 
set history=1000

" Python specific 
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4

au BufRead,BufNewFile *.cabal set ft=haskell

let g:go_fmt_command = "goimports"


"au BufWrite *.py :Autoformat

set relativenumber

vnoremap <leader>y  "+y
nnoremap <leader>p "+p

" Completion
"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Go specific
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
nnoremap <silent> <leader>l :nohl<CR><C-l>

" Smarter movement on wrapped lines.
nmap j gj
nmap k gk

" Exit insertion mode
inoremap jk <ESC>

let g:airline_theme='simple'

nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <F5> :UndotreeToggle<cr>
nmap <F8> :TagbarToggle<CR>

let g:ctrlp_show_hidden = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Remove history search.
map q: <Nop>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Show buffer number.
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Return to last edit position when opening files.
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

fun! s:SelectColorS()
  exec 'DimInactiveOff'
  50vnew
  setlocal bufhidden=wipe buftype=nofile nonu fdc=0
  file ColorSchemeSelector
  let files = split(glob(expand('~/.local/share/nvim/plugged/vim-colorschemes/colors/').'*'))
  for file in files
	let name = fnamemodify( file, ':t:r' )
	if strlen(name) > 0
      put=name
	endif
  endfor
  normal ggdd
  setlocal nomodifiable
  setlocal cursorline
  hi CursorLine gui=reverse
  nmap <buffer>  <cr>  :exec 'colorscheme ' . getline('.')<CR>
  nmap <buffer>  q     :exec 'DimInactiveOn' <bar> quit<CR>   
endf
com! SelectColorS :cal s:SelectColorS()

let g:diminactive_use_syntax = 1

