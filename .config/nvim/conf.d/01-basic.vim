" Filetype based syntax highlighting.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Syntax highlighting is slow with long lines.
" Sets a maximum length for highlighting lines.
set synmaxcol=500

" Show command and selected characters in status line.
set showcmd

" Don't jump to the start of the line when switching buffers.
set nostartofline

" Don't show mode in command-line, because we already show it in lightline.
set noshowmode

" Automatically reload file if changed by environment.
set autoread

" utf-8 is the best <3
set termencoding=utf-8 encoding=utf-8 fileformat=unix
" Detect the encoding of every file you read (in order to determine the value
" of fileencoding)
set fileencodings=ucs-bom,utf8,prc

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Explicitly state file-endings.
set fileformats=unix,dos,mac

" Hides buffers instead of forcing them to close.
set hidden

" Language settings
let $LANG='en'
set langmenu=en helplang=en

" Line numbering
set number

" Show matching parenthesis.
set showmatch

" "Just turn the dang bell off".
set belloff=all

" Keep undo history across sessions by storing it in a file
let g:swapDir = $XDG_CACHE_HOME.'/nvim/swap'
if !isdirectory(g:swapDir)
    call mkdir(g:swapDir)
endif
let &directory=g:swapDir
let &backupdir=g:swapDir
let &undodir=g:swapDir
set undofile

" More XDG.
set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo
let g:netrw_home=$XDG_CACHE_HOME.'/nvim'

" Enables mouse scrolling
set mouse=a

" Make updates happen faster (swap stuff).
set updatetime=250

" Visual autocomplete for command menu
set wildmenu
set wildmode=list:longest,full

" Start searching automatically when typing
set incsearch

" Ignore case when searching.
set ignorecase
" Switch to case sensitive when having both cases in query.
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
set scrolloff=5

" Indention is 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent
set cindent

" Keep more info in memory, commands etc.
set history=1000

" Remove the splash message.
set shortmess=I

cabbr <expr> @@ ChompedSystem("git rev-parse --show-toplevel")
" Expand $$ to nvim config folder.
cabbr <expr> $$ "$XDG_CONFIG_HOME/nvim/conf.d"
" Expand %% to current files working directory.
cabbr <expr> %% expand('%:p:h')

" Return to last edit position when opening files.
augroup LastPosition
    autocmd!
    autocmd BufReadPost * call LastPosition()
augroup END
" Search for tag-file, used for method jumping
set tags=./tags;

" Change folder automatically
autocmd BufEnter * silent! lcd %:p:h

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:\|\ ,eol:¬\,trail:·
set list

" Automatically remove netrw buffers.
autocmd FileType netrw setl bufhidden=delete
