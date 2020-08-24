" Hides buffers instead of forcing them to close.
" Allow switching of buffers without saving them first.
set hidden

" Line numbering
set number

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Syntax highlighting is slow with long lines.
" Sets a maximum length for highlighting lines.
set synmaxcol=5000

" Don't jump to the start of the line when switching buffers.
set nostartofline

" Unix newlines. Always.
set fileformat=unix

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Enables mouse scrolling
set mouse=a

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

" Don't show mode in command-line, because we already show it in the
" statusbar.
set noshowmode

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

set formatoptions-=c formatoptions-=r formatoptions-=o
" autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set undofile
let &backupdir=&directory
" Write to swap after nothing happens for this duration.
set updatetime=250

let g:netrw_home=$XDG_DATA_HOME.'/nvim'

" Remove the splash message.
set shortmess+=I

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Indention is 4 spaces
" set shiftwidth=4
set tabstop=4
" set softtabstop=4
" set smartindent
set cindent
