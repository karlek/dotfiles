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

" Better swap-handling
Plug 'gioele/vim-autoswap'

" Rename files.
Plug 'danro/rename.vim'

" Header highlighting.
Plug 'vim-scripts/headers.vim'

" Colorscheme pack
Plug 'flazz/vim-colorschemes'

" Css colors
Plug 'ap/vim-css-color'

" Undo tree
Plug 'mbbill/undotree'

" Autodetect Indentation
Plug 'tpope/vim-sleuth'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Automatically insert closing delimeter.
Plug 'Townk/vim-autoclose'

" Tagbar
Plug 'majutsushi/tagbar'

" Easy motion (vimfx)
Plug 'easymotion/vim-easymotion'

" zen-mode
Plug 'junegunn/goyo.vim'

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
Plug 'tpope/vim-commentary'

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

