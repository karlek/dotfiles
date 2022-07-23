" Hides buffers instead of forcing them to close.
" Allow switching of buffers without saving them first.
set hidden

" Line numbering
set number

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

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
" :help last-position-jump
augroup LastPosition
	autocmd!
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup END

" Show tab, end-of-line and trailing whitespaces.
set list listchars=tab:\|\ ,trail:·,lead:·

" Don't insert comments automatically after another comment.
" c:	Auto-wrap comments using textwidth, inserting the current comment
" leader automatically.
set formatoptions-=c

" Save undo history between sessions.
set undofile
" List of directories for the backup file, separated with commas.
let &backupdir=&directory
" Write to swap if nothing happens after this duration.
set updatetime=250

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

augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" Figure out the system Python for Neovim.
if exists('$VIRTUAL_ENV')
	let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), "\n", '', 'g')
else
	let g:python3_host_prog=substitute(system('which python3'), "\n", '', 'g')
endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
