set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged')

" Colocoding
Plug 'ferranpm/vim-colorcode'

" Ctrl-p
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neopairs.vim'
" Completion for python
Plug 'zchee/deoplete-jedi'
" Completion for go
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Snippets!
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Header highlighting
Plug 'vim-scripts/headers.vim'

" Colorscheme pack
Plug 'flazz/vim-colorschemes'

" Css colors
Plug 'ap/vim-css-color'

" Undo tree
Plug 'mbbill/undotree'

" Autodetect Indentation
Plug 'tpope/vim-sleuth'

" Diff on recover
Plug 'chrisbra/Recover.vim'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Automatically insert closing delimeter.
Plug 'Townk/vim-autoclose'

" Tagbar
Plug 'majutsushi/tagbar'

" Easy motion (vimfx)
Plug 'easymotion/vim-easymotion'

" zen-mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Language support
Plug 'sheerun/vim-polyglot'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Bufferline
Plug 'bling/vim-bufferline'

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

colorscheme pride " pride badwolf PaperColor

" Automatically reload file if changed by envrionment.
set autoread
" Automatically write when making.
set autoread

" utf-8 is the best <3
set termencoding=utf-8 encoding=utf-8 fileformat=unix

" Explicitly file-endings.
set ffs=unix,dos,mac

" Hides buffers instead of forcing them to close.
set hidden

" Language settings
let $LANG='en'
set langmenu=en helplang=en

" Line numbering
set number
set relativenumber

" Show matching paranthesis.
set showmatch

" "Just turn the dang bell off".
set belloff=all

" Keep undo history across sessions by storing it in a file
let swapDir = $XDG_CACHE_HOME.'/nvim/swap'
call system('mkdir ' . swapDir)
let &directory=swapDir
let &backupdir=swapDir
let &undodir=swapDir
set undofile
" More XDG.
set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" Enables mouse scrolling
set mouse=a

" Visual autocomplete for command menu
set wildmenu
set wildmode=list:longest,full

" Start searching automatically when typing
set incsearch

" Ignore case when searching, and switch to case sensitive when having both
" cases.
set ignorecase
set smartcase

" Allow switching of buffers without saving them first.
set hidden

" Highlight line but not column.
set cursorline nocursorcolumn

" Word wraping.
set wrap linebreak

" Show as much as possible of the last line.
set display=lastline

" Minimum number of lines surrounding cursor.
set scrolloff=3

" Indention is 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set cindent

" Keep more info in memory, commands etc.
set history=1000

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

nnoremap <leader>t :CtrlP<cr>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)

" Recognize .md filenames as markdown
au BufRead,BufNewFile *.md set filetype=markdown
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

" Clear search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" Smarter movement on wrapped lines.
nnoremap j gj
nnoremap k gk

" Exit insertion mode
inoremap jk <ESC>

" Disable command history search.
map q: <Nop>
" Disable help key.
nmap <F1> :echo<CR>

" Remove trailing spaces.
nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <F5> :UndotreeToggle<cr>
nmap <F8> :TagbarToggle<CR>

" Show hidden files with Ctrl-P.
let g:ctrlp_show_hidden = 1

" More intuitive cursor graphic.
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let g:diminactive_use_syntax = 1

" Don't show buffers in command line.
let g:bufferline_echo = 0

let g:airline_theme='badwolf'

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

" I want to use my tab more smarter. If we are inside a completion menu jump
" to the next item. Otherwise check if there is any snippet to expand, if yes
" expand it. Also if inside a snippet and we need to jump tab jumps. If none
" of the above matches we just call our usual 'tab'.
function! s:neosnippet_complete()
	if pumvisible()
		return "\<c-n>"
	else
		if neosnippet#expandable_or_jumpable()
			return "\<Plug>(neosnippet_expand_or_jump)"
		endif
		return "\<tab>"
	endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()
