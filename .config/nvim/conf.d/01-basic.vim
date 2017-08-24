" Filetype based syntax highlighting.
filetype plugin indent on

" Enable syntax highlighting.
syntax on

" Syntax highlighting is slow with long lines.
" Sets a maximum length for highlighting lines.
set synmaxcol=500

" Show command and selected characters in status line.
set showcmd

" Automatically reload file if changed by environment.
set autoread
" Auto change directory to current files.
set autochdir

" utf-8 is the best <3
set termencoding=utf-8 encoding=utf-8 fileformat=unix
" Detect the encoding of every file you read (in order to determine the value
" of fileencoding)
set fileencodings=ucs-bom,utf8,prc

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Explicitly state file-endings.
set ffs=unix,dos,mac

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
let swapDir = $XDG_CACHE_HOME.'/nvim/swap'
if !isdirectory(swapDir)
    call mkdir(swapDir)
endif
let &directory=swapDir
let &backupdir=swapDir
let &undodir=swapDir
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
set scrolloff=7

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

function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

" Run Neomake on save.
autocmd! BufWritePost * Neomake

" Return to last edit position when opening files.
autocmd BufReadPost * call LastPosition()

fun! LastPosition()
    " Ignore git commit messages.
    let name = fnamemodify( expand('%'), ':t:r' )
    if name =~ 'COMMIT_EDITMSG'
        return
    endif
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute "normal! g`\"" |
    endif
endfun

" Override gx.
nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>

function! s:plug_gx()
	" Add netrw_gx support for Plug repos.
	if getline('.') =~ '^Plug\s'
		let cfile = expand('<cfile>')
		if cfile !~ 'github\.com' && !filereadable(cfile)
			call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
						\ 'https://github.com/'.cfile)), netrw#CheckIfRemote())
			return
		endif
	endif

	call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx :
				\ '<cfile>')), netrw#CheckIfRemote())
endfunction

nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>

set tags=./tags;
