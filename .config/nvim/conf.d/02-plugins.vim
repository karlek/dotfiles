call plug#begin('~/.local/share/nvim/plugged')

" Languages
Plug 'vim-scripts/headers.vim'                                                " HTTP Header highlighting
Plug 'zchee/deoplete-jedi',       { 'for': 'python' }                         " Completion for python
Plug 'fatih/vim-go',              { 'for': 'go', 'do': ':GoInstallBinaries' } " Golang support
Plug 'zchee/deoplete-go',         { 'for': 'go', 'do': 'make'}                " Completion for go
Plug 'eagletmt/neco-ghc',         { 'for': 'haskell' }                        " Haskell support
Plug 'eagletmt/ghcmod-vim',       { 'for': 'haskell' }                        " Haskell support
Plug 'ap/vim-css-color',          { 'for': 'css' }                            " Css colors
Plug 'arakashic/chromatica.nvim', { 'for': 'c' }                              " Clang highlighting for c-family
Plug 'Harenome/vim-mipssyntax',   { 'for': 'mips' }                           " Mips syntax
Plug 'vim-scripts/matlab.vim',    { 'for': 'matlab' }                         " Matlab syntax
Plug 'lervag/vimtex',             { 'for': 'latex' }                          " LaTeX handling
Plug 'racer-rust/vim-racer',      { 'for': 'rust' }                           " Rust racer

" Snippets
Plug 'Shougo/neosnippet'                                                      " Snippet engine
Plug 'Shougo/neosnippet-snippets'                                             " Snippets for a plethora of languages
Plug 'honza/vim-snippets'                                                     " More snippets

" Functionality
Plug 'b4winckler/vim-angry'                                                   " Function argument handling. d2aa (|a, b, c) -> (c)
Plug 'mileszs/ack.vim'		                                                  " Search in files
Plug 'danro/rename.vim'                                                       " Rename files
Plug 'junegunn/vim-easy-align'                                                " Easy alignment
Plug 'maxbrunsfeld/vim-yankstack'                                             " Yankstack or https://github.com/vim-scripts/YankRing.vim
Plug 'neomake/neomake'                                                        " Make and lint system
Plug 'tpope/vim-speeddating'												  " Increment dates and times
Plug 'tpope/vim-commentary'                                                   " Toggle comments plugin
Plug 'tpope/vim-repeat'                                                       " Extended repeat for some plugins
Plug 'tpope/vim-vinegar'                                                      " Netrw enhancer.
Plug 'tpope/vim-surround'                                                     " Change surrounding characters
Plug 'tpope/vim-sleuth'                                                       " Automatically set buffer options
Plug 'vim-scripts/visSum.vim'                                                 " Sum visual selection
Plug 'matze/vim-move'														  " Move blocks of text
Plug 'terryma/vim-smooth-scroll'											  " Smooth scrolling
Plug 'Shougo/deoplete.nvim',      { 'do': ':UpdateRemotePlugins' }            " Completion engine
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }               " Easy motion (vimfx)

" Appearance
Plug 'w0ng/vim-hybrid',                                                       " Hybrid colorscheme
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'blueyed/vim-diminactive'                                                " Dim inactive pane/window
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar
Plug 'ctrlpvim/ctrlp.vim'                                                     " Switch buffer plugin
Plug 'mhinz/vim-startify'                                                     " Start screen vim
Plug 'mbbill/undotree'                                                        " Undo tree
Plug 'majutsushi/tagbar'                                                      " Tagbar
Plug 'junegunn/goyo.vim'													  " Zen-mode
Plug 'google/vim-searchindex'												  " Number of search results

" Web editing
Plug 'jaxbot/browserlink.vim',    { 'for': 'html' }                           " Live reload
Plug 'mattn/emmet-vim',           { 'for': 'html' }                           " Emmet

call plug#end()                                                               " required
