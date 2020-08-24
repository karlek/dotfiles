set encoding=utf-8
scriptencoding utf-8

" Filetype based syntax highlighting.
filetype plugin indent on

" Syntax highlighting is slow with long lines.
" Sets a maximum length for highlighting lines.
set synmaxcol=5000

" Don't jump to the start of the line when switching buffers.
set nostartofline

" Don't show mode in command-line, because we already show it in the
" statusbar.
set noshowmode

" Unix newlines. Always.
set fileformat=unix
" Detect the encoding of every file you read (in order to determine the value
" of fileencoding)
set fileencodings=ucs-bom,utf8,prc

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Explicitly state file-endings.
set fileformats=unix,dos,mac

" Hides buffers instead of forcing them to close.
" Allow switching of buffers without saving them first.
set hidden

" Language settings
let $LANG='en'
set langmenu=en helplang=en

" Line numbering
set number

" When a bracket is inserted, briefly jump to the matching one.
set showmatch
" Keep undo history across sessions by storing it in a file
let g:swapDir = $XDG_CACHE_HOME.'/nvim/swap//'
if !isdirectory(g:swapDir)
	call mkdir(g:swapDir)
endif
let &directory=g:swapDir
let &backupdir=g:swapDir
let &undodir=g:swapDir
set undofile

" More XDG.
set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo
" Directory where netrw bookmarks and history are saved.
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" Enables mouse scrolling
set mouse=a

" Write to swap after nothing happens for this duration.
set updatetime=250

" Visual autocomplete for command menu
set wildmode=list:longest,full
set wildignore=*.pyc

" Ignore case when searching.
set ignorecase
" Switch to case sensitive when having both cases in query.
set smartcase

" Highlight line but not column.
set cursorline nocursorcolumn

" Word wraping.
set wrap linebreak

" Minimum number of lines surrounding cursor.
set scrolloff=3

" Indention is 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set cindent

" Remove the splash message.
set shortmess+=I
" Don't give |ins-completion-menu| messages.
set shortmess+=c
" Show search count message when searching.
set shortmess-=S

" Expand @@ to project root
cabbr <expr> @@ ChompedSystem('git rev-parse --show-toplevel')
" Expand $$ to nvim config folder.
cabbr <expr> $$ '$XDG_CONFIG_HOME/nvim/conf.d'
" Expand %% to current files working directory.
cabbr <expr> %% expand('%:p:h')

" Return to last edit position when opening files.
augroup LastPosition
	autocmd!
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup END

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:\|\ ,eol:¬\,trail:·
set list

" Automatically remove netrw buffers.
augroup RemoveNetrwBuffers
	autocmd!
	autocmd FileType netrw setl bufhidden=delete
augroup END

" Don't auto insert comments.
set formatoptions-=cro
 
" Figure out the system Python for Neovim.
if exists('$VIRTUAL_ENV')
    let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system('which python3'), "\n", '', 'g')
endif

set nrformats-=octal

" always show signcolumns
set signcolumn=yes

" https://github.com/vim/vim/issues/2049
set maxmempattern=5000
