call plug#begin('~/.local/share/nvim/plugged')

" Apperance
Plug 'karlek/vim-colorschemes'                                         " Colorscheme pack
Plug 'itchyny/lightline.vim'                                           " Lightline status line
Plug 'kshenoy/vim-signature'                                           " Vim marker sidebar

" Fundamental
Plug 'tpope/vim-vinegar'                                               " Netrw enhancer.
Plug 'wellle/targets.vim'                                              " Allow changing inside objects from anywhere on the line.
Plug 'tpope/vim-rsi'                                                   " Readline insertion keybindings
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }        " Easy motion (vimfx)
Plug 'tpope/vim-commentary'                                            " Toggle comments plugin
Plug 'wsdjeg/vim-fetch'                                                " Allow opening files with line number file:47

" Not fundamental
Plug 'tpope/vim-repeat'                                                " Repeat complex motions such as vim-surround
Plug 'tpope/vim-surround'                                              " Can't live without, but not perfect.
Plug 'jiangmiao/auto-pairs'                                            " Can't live without, but not perfect.
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'                                         " Align characters, addictive.

" Extra
Plug 'folke/zen-mode.nvim'                                             " Zen-mode
Plug 'folke/twilight.nvim'                                             " Only highlight lines near cursor.

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}            " Improved syntax highlighting engine.
Plug 'neovim/nvim-lspconfig'                                           " Enable LSP features.

" Languages
Plug 'mattn/vim-goimports'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-llvm'
Plug 'neovimhaskell/haskell-vim'
Plug 'ziglang/zig.vim'

Plug 'luukvbaal/stabilize.nvim'                                        " Buffer stays in-place while opening quickfix / location list.
Plug 'github/copilot.vim'                                              " Meme completion.
"
Plug 'ayu-theme/ayu-vim'
Plug 'mvpopuk/inspired-github.vim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()                                                               " required

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" set omnifunc=v:lua.vim.lsp.omnifunc
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

runtime! conf.d/plugins/*.vim
