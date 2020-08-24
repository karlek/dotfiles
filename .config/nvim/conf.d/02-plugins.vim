call plug#begin('~/.local/share/nvim/plugged')

" Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
" Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile'}

" Code completion
Plug 'Shougo/deoplete.nvim',      { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" For Denite features
Plug 'Shougo/denite.nvim'
Plug 'neomake/neomake'

" Language specific plugins for code completion
Plug 'deoplete-plugins/deoplete-go',         { 'do': 'make'}
Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'sebastianmarkow/deoplete-rust'

" Language specific plugins
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}                       " Better semantic highlighting for Python
Plug 'lervag/vimtex',   { 'for': 'latex' }                                    " LaTeX handling
Plug 'fatih/vim-go'                                                           " Golang
Plug 'HerringtonDarkholme/yats.vim'                                           " Typescript syntax highlighting
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}                    " Typescript language server
Plug 'ap/vim-css-color'
" Plug 'rust-lang/rust.vim'

" Functionality
Plug 'jiangmiao/auto-pairs'                                                   " Auto pairs
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
Plug 'wsdjeg/vim-fetch'                                                       " Allow opening files with line number file:47

" Apperance
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'junegunn/limelight.vim'                                                 " Zen-mode
Plug 'junegunn/goyo.vim'                                                      " Zen-mode
Plug 'airblade/vim-gitgutter'                                                 " Display git symbols for changes in the gutter.
Plug 'machakann/vim-highlightedyank'                                          " Temporarily highlight yanked selection

" Sidebars
Plug 'mbbill/undotree'                                                        " Undo tree
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar

" Soon removed!
Plug 'google/vim-searchindex'                                                 " Number of search results

" Test zone
Plug 'markonm/traces.vim'                                                     " Preview substitutions
Plug 'psliwka/vim-smoothie'                                                   " Smooth scrolling

" gA shows the four representations of the number under the cursor.
" crd, crx, cro, crb convert the number under the cursor to decimal, hex, octal, binary, respectively.
Plug 'glts/vim-radical'
Plug 'glts/vim-magnum'                                                        " Dependency, vim-radical
Plug 'sk1418/HowMuch'                                                         " Vim calculator

Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'tpope/vim-sleuth'
" Plug 'chaoren/vim-wordmotion'
Plug 'Konfekt/vim-CtrlXA'                                                     " Supercharge C-x C-a

call plug#end()                                                               " required

runtime! conf.d/plugins/*
