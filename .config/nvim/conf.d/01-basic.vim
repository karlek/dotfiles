" Line numbering
set number

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Enables mouse scrolling
set mouse=a

" Ignore case when searching.
" Switch to case sensitive when having both cases in query.
set ignorecase smartcase

" Highlight line but not column.
set cursorline

" Word wraping.
set linebreak

" Minimum number of lines surrounding cursor.
set scrolloff=3

" Tabs should be tabs.
set noexpandtab

" Don't show mode in command-line, because we already show it in the
" statusbar.
set noshowmode

" Expand @@ to project root
cabbr <expr> @@ substitute(system('git rev-parse --show-toplevel'), "\n", '', 'g')
" Expand $$ to nvim config folder.
cabbr <expr> $$ '$XDG_CONFIG_HOME/nvim/conf.d'
" Expand %% to current files working directory.
cabbr <expr> %% expand('%:p:h')


" Show tab, end-of-line and trailing whitespaces.
set list listchars=tab:\|\ ,trail:·,lead:·,nbsp:◇

" Don't insert comments automatically after another comment.
" c:	Auto-wrap comments using textwidth, inserting the current comment
" leader automatically.
set formatoptions-=c

" Save undo history between sessions.
set undofile
" List of directories for the backup file, separated with commas.
let &backupdir=&directory
" Write to swap if nothing happens after this duration.
set updatetime=100

" Remove the splash message.
" Don't give |ins-completion-menu| messages.
set shortmess+=I shortmess+=c

" Number of spaces to use for each step of (auto)indent. Used for >> and <<.
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for.
set tabstop=4
" Remove four spaces like a tab.
set softtabstop=4
" When shifting lines (>> & <<), round the indentation to the nearest multiple
" of `shiftwidth.`
set shiftround

" Update the document interactively with `:s`
set inccommand=split

" Enables 24-bit RGB color in the |TUI|.
set termguicolors

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

let g:loaded_matchparen=1
augroup LargeFile
	let g:large_file = 50*1024

	" Set options:
	"   eventignore+=FileType (no syntax highlighting etc
	"   assumes FileType always on)
	"   noswapfile (save copy of file)
	"   bufhidden=unload (save memory when other file is viewed)
	"   buftype=nowritefile (is read-only)
	"   undolevels=-1 (no undo possible)
	au BufReadPre *
				\ let f=expand("<afile>") |
				\ if getfsize(f) > g:large_file |
				\ set eventignore+=FileType |
				\ setlocal syntax=off filetype=off noundofile noloadplugins nolinebreak noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
				\ else |
				\ set eventignore-=FileType |
				\ endif
augroup END
