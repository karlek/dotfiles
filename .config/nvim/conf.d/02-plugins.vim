call plug#begin('~/.local/share/nvim/plugged')

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

" Language support for multiple languages.
Plug 'sheerun/vim-polyglot'

" Golang support
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

" Haskell support.
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

" Clang highlighting for c-family.
Plug 'arakashic/chromatica.nvim', { 'for': 'c' }

" Mips syntax
Plug 'Harenome/vim-mipssyntax', { 'for': 'mips' }

" Matlab syntax
Plug 'vim-scripts/matlab.vim', { 'for': 'matlab' }

" LaTeX handling.
Plug 'lervag/vimtex', { 'for': 'latex' }

" Rust racer.
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

" Switch buffer plugin.
Plug 'ctrlpvim/ctrlp.vim'

" Start screen vim
Plug 'mhinz/vim-startify'

" Rename files.
Plug 'danro/rename.vim'

" Yankstack
Plug 'maxbrunsfeld/vim-yankstack'

" Undo tree
Plug 'mbbill/undotree'

" Tagbar
Plug 'majutsushi/tagbar'

" Easy motion (vimfx)
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }

" zen-mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

" Live reload.
Plug 'jaxbot/browserlink.vim', { 'for': 'html' }

" Emmet
Plug 'mattn/emmet-vim', { 'for': 'html' }

" " Autodetect Indentation
" Plug 'tpope/vim-sleuth'

" Change surrounding characters.
Plug 'tpope/vim-surround'

" Toggle comments plugin.
Plug 'tpope/vim-commentary'

" Extended repeat for some plugins.
Plug 'tpope/vim-repeat'

" Header highlighting.
Plug 'vim-scripts/headers.vim'

" " Colorscheme pack.
Plug 'karlek/vim-colorschemes'

" Css colors
Plug 'ap/vim-css-color', { 'for': 'css' }

" Dim inactive pane/window
Plug 'blueyed/vim-diminactive'

" Dependency. Asynch engine for old plugins.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Lightline status line.
Plug 'itchyny/lightline.vim'

" Function argument handling. d2aa (|a, b, c) -> (c)
Plug 'b4winckler/vim-angry'

" Vim marker sidebar.
Plug 'kshenoy/vim-signature'

" Sum visual selection
Plug 'vim-scripts/visSum.vim'

" Easy alignment.
Plug 'junegunn/vim-easy-align'

" Better swap-handling
" Plug 'gioele/vim-autoswap'

" Make and lint system.
Plug 'neomake/neomake'

call plug#end()            " required
