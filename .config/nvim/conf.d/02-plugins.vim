call plug#begin('~/.local/share/nvim/plugged')

" Apperance
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar

" Fundamental
Plug 'tpope/vim-vinegar'                                                      " Netrw enhancer.
Plug 'wellle/targets.vim'                                                     " Allow changing inside objects from anywhere on the line.
Plug 'tpope/vim-rsi'                                                          " Readline insertion keybindings
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }               " Easy motion (vimfx)
Plug 'tpope/vim-commentary'                                                   " Toggle comments plugin
Plug 'wsdjeg/vim-fetch'                                                       " Allow opening files with line number file:47

" Not fundamental
Plug 'tpope/vim-repeat'                                                       " Repeat complex motions such as vim-surround
Plug 'tpope/vim-surround'                                                     " Can't live without, but not perfect.
Plug 'jiangmiao/auto-pairs'                                                   " Can't live without, but not perfect.
Plug 'junegunn/fzf.vim'

" Languages
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}                       " Better semantic highlighting for Python. Can't live without, but not perfect.

" Extra
" Plug 'tpope/vim-unimpaired'                                                   " TODO: re-evaluate the need. Many shortcuts
" Plug 'junegunn/limelight.vim'                                                 " Zen-mode
" Plug 'junegunn/goyo.vim'                                                      " Zen-mode
"
"
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                   " Improved syntax highlighting engine. Messes with indentation at the moment.
" Plug 'neovim/nvim-lspconfig'
call plug#end()                                                               " required
runtime! conf.d/plugins/*.vim
