call plug#begin('~/.local/share/nvim/plugged')

" Code completion
Plug 'Shougo/deoplete.nvim',      { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Language specific plugins for code completion
Plug 'deoplete-plugins/deoplete-go',         { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'

" Language specific plugins
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}                       " Better semantic highlighting for Python
Plug 'lervag/vimtex',   { 'for': 'latex' }                                    " LaTeX handling
Plug 'fatih/vim-go'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'ap/vim-css-color'

" Functionality
Plug 'majutsushi/tagbar'                                                      " Add tag bar
Plug 'junegunn/vim-easy-align'                                                " Easy alignment
Plug 'tpope/vim-commentary'                                                   " Toggle comments plugin
Plug 'tpope/vim-eunuch'                                                       " Rename files
Plug 'tpope/vim-repeat'                                                       " Extended repeat for some plugins
Plug 'tpope/vim-rsi'                                                          " Readline insertion keybindings
Plug 'tpope/vim-surround'                                                     " Change surrounding characters
Plug 'tpope/vim-unimpaired'                                                   " Common options as keybindings
Plug 'tpope/vim-vinegar'                                                      " Netrw enhancer.
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }               " Easy motion (vimfx)
Plug 'milkypostman/vim-togglelist'                                            " Add shortcuts for toggling quick- and location list.
Plug 'wellle/targets.vim'                                                     " Add more textobjects targets. d2aa (|a, b, c) -> (c)
Plug 'ctrlpvim/ctrlp.vim'                                                     " Switch buffer plugin
Plug 'ludovicchabant/vim-gutentags'                                           " Automatic tag handling
Plug 'editorconfig/editorconfig-vim'

" Apperance
Plug 'Yggdroot/indentLine'                                                    " Indentation guide
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'google/vim-searchindex'                                                 " Number of search results
Plug 'junegunn/limelight.vim'                                                 " Zen-mode
Plug 'junegunn/goyo.vim'                                                      " Zen-mode
Plug 'airblade/vim-gitgutter'                                                 " Display git symbols for changes in the gutter.

" Sidebars
Plug 'mbbill/undotree'                                                        " Undo tree
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar

call plug#end()                                                               " required

runtime! conf.d/plugins/*
