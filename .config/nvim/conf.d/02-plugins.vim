call plug#begin('~/.local/share/nvim/plugged')

" Languages
Plug 'fatih/vim-go',              { 'for': 'go', 'do': ':GoInstallBinaries' } " Golang support
Plug 'eagletmt/neco-ghc',         { 'for': 'haskell' }                        " Haskell support
Plug 'eagletmt/ghcmod-vim',       { 'for': 'haskell' }                        " Haskell support
Plug 'ap/vim-css-color',          { 'for': 'css' }                            " Css colors
Plug 'arakashic/chromatica.nvim', { 'for': 'c' }                              " Clang highlighting for c-family
Plug 'Harenome/vim-mipssyntax',   { 'for': 'mips' }                           " Mips syntax
Plug 'vim-scripts/matlab.vim',    { 'for': 'matlab' }                         " Matlab syntax
Plug 'lervag/vimtex',             { 'for': 'latex' }                          " LaTeX handling
Plug 'racer-rust/vim-racer',      { 'for': 'rust' }                           " Rust racer autocompletion, etc.
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }                           " Rust langauge support.
Plug 'tpope/vim-jdaddy',          { 'for': 'json'}                            " JSON handler.
Plug 'dag/vim-fish',              { 'for': 'fish' }                           " Fish support.
Plug 'tikhomirov/vim-glsl'                                                    " Support for GLSL

" Completion
Plug 'roxma/nvim-completion-manager'                                          " Completion engine

" Snippets
Plug 'Shougo/neosnippet'                                                      " Snippet engine
Plug 'Shougo/neosnippet-snippets'                                             " Snippets for a plethora of languages
Plug 'honza/vim-snippets'                                                     " More snippets

" Functionality
Plug 'tpope/vim-eunuch'                                                       " Rename files
Plug 'junegunn/vim-easy-align'                                                " Easy alignment
Plug 'neomake/neomake'                                                        " Make and lint system
Plug 'tpope/vim-commentary'                                                   " Toggle comments plugin
Plug 'tpope/vim-repeat'                                                       " Extended repeat for some plugins
Plug 'tpope/vim-vinegar'                                                      " Netrw enhancer.
Plug 'tpope/vim-surround'                                                     " Change surrounding characters
Plug 'tpope/vim-sleuth'                                                       " Automatically set buffer options
Plug 'tpope/vim-unimpaired'                                                   " Common options as keybindings
Plug 'terryma/vim-smooth-scroll'                                              " Smooth scrolling
Plug 'jiangmiao/auto-pairs'                                                   " Auto inserts/deletes brackets, parens, quotes.
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }               " Easy motion (vimfx)
Plug 'mileszs/ack.vim'                                                        " Ack (ag) integration.
Plug 'milkypostman/vim-togglelist'                                            " Add shortcuts for toggling quick- and location list.
Plug 'wellle/targets.vim'                                                     " Add more textobjects targets. d2aa (|a, b, c) -> (c)

" Appearance
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'blueyed/vim-diminactive'                                                " Dim inactive pane/window
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'ctrlpvim/ctrlp.vim'                                                     " Switch buffer plugin
Plug 'JazzCore/ctrlp-cmatcher',   { 'do': './install.sh'}                     " Faster matcher
Plug 'junegunn/goyo.vim'                                                      " Zen-mode
Plug 'google/vim-searchindex'                                                 " Number of search results

" Sidebars
Plug 'mbbill/undotree'                                                        " Undo tree
Plug 'majutsushi/tagbar'                                                      " Tagbar
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar

" Web editing
Plug 'jaxbot/browserlink.vim',    { 'for': 'html' }                           " Live reload
Plug 'mattn/emmet-vim',           { 'for': 'html' }                           " Emmet

" Dependencies
Plug 'Shougo/vimproc.vim',                                                    " Dependency for ghcmod-vim

" Testing zone
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'

call plug#end()                                                               " required

runtime! conf.d/plugins/*
