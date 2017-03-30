call plug#begin('~/.local/share/nvim/plugged')

" Denite.vim
Plug 'Shougo/denite.nvim'

" Completion engine.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neopairs.vim'

" Completion for python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Completion for go
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Snippets!
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Better swap-handling
Plug 'gioele/vim-autoswap'

" Start screen vim
Plug 'mhinz/vim-startify'

" Rename files.
Plug 'danro/rename.vim'

" Header highlighting.
Plug 'vim-scripts/headers.vim'

" Colorscheme pack
Plug 'flazz/vim-colorschemes'
" Colorscheme badwolf
Plug 'sjl/badwolf'

" Css colors
Plug 'ap/vim-css-color', { 'for': 'css' }

" Undo tree
Plug 'mbbill/undotree'

" Syntax checker.
Plug 'neomake/neomake'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Clang highlighting for c-family.
Plug 'arakashic/chromatica.nvim', { 'for': 'c' }

" Mips syntax
Plug 'Harenome/vim-mipssyntax', { 'for': 'mips' }

" Matlab syntax
Plug 'vim-scripts/matlab.vim', { 'for': 'matlab' }

" Tagbar
Plug 'majutsushi/tagbar'

" Easy motion (vimfx)
Plug 'easymotion/vim-easymotion'

" zen-mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Live reload.
Plug 'jaxbot/browserlink.vim', { 'for': 'html' }

" Emmet
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Dim inactive pane/window
Plug 'blueyed/vim-diminactive'

" Autodetect Indentation
Plug 'tpope/vim-sleuth'

" Change surrounding characters.
Plug 'tpope/vim-surround'

" Toggle comments plugin.
Plug 'tpope/vim-commentary'

" Extended repeat for some plugins.
Plug 'tpope/vim-repeat'

" Language support for multiple languages.
Plug 'sheerun/vim-polyglot'

" Golang support
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Haskell support.
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" Dependency. Asynch engine for old plugins.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Airline status line.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LaTeX handling.
Plug 'lervag/vimtex', { 'for': 'latex' }

" Multiple cursors. C-n, C-x
Plug 'terryma/vim-multiple-cursors'

" Function argument handling. d2aa (|a, b, c) -> (c)
Plug 'b4winckler/vim-angry'

" Grep handler for vim.
Plug 'mhinz/vim-grepper'

" Highlight f and F targets.
Plug 'unblevable/quick-scope'

call plug#end()            " required
