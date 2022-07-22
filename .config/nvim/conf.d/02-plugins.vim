call plug#begin('~/.local/share/nvim/plugged')

" Apperance
Plug 'karlek/vim-colorschemes'                                         " Colorscheme pack
Plug 'nvim-lualine/lualine.nvim'                                       " Statusbar.
Plug 'kshenoy/vim-signature'                                           " Vim marker sidebar

Plug 'ayu-theme/ayu-vim'
Plug 'mvpopuk/inspired-github.vim'

" Fundamental
Plug 'tpope/vim-vinegar'                                               " Netrw enhancer.
Plug 'wellle/targets.vim'                                              " Allow changing inside objects from anywhere on the line.
Plug 'tpope/vim-rsi'                                                   " Readline insertion keybindings
Plug 'phaazon/hop.nvim'                                                " Jump to anywhere.

Plug 'tpope/vim-commentary'                                            " Toggle comments plugin
Plug 'JoosepAlviste/nvim-ts-context-commentstring'                     " Treesitter aware commentstring, fixes html/js, vim/lua, etc

" Not fundamental
Plug 'tpope/vim-repeat'                                                " Repeat complex motions such as vim-surround
Plug 'tpope/vim-surround'                                              " Can't live without, but not perfect.
Plug 'jiangmiao/auto-pairs'                                            " Can't live without, but not perfect.
Plug 'junegunn/vim-easy-align'                                         " Align characters, addictive.
Plug 'wsdjeg/vim-fetch'                                                " Allow opening files with line number file:47

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

Plug 'nvim-telescope/telescope.nvim'                                   " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'                                           " Telescope dependency.
Plug 'BurntSushi/ripgrep'                                              " Ripgrep plugin for telescope

Plug 'lukas-reineke/indent-blankline.nvim'                             " Visualize indentation levels.
Plug 'lewis6991/gitsigns.nvim'                                         " Clean git add/removed/modified signs.
Plug 'ludovicchabant/vim-gutentags'                                    " Automatically generate tags file.
Plug 'rhysd/conflict-marker.vim'                                       " Highlight git conflict markers
Plug 'p00f/nvim-ts-rainbow'                                            " Rainbow parentheses.
Plug 'nacro90/numb.nvim'                                               " Preview line jumps, i.e. :123
Plug 'mg979/vim-visual-multi'

call plug#end()                                                        " Required.

runtime! conf.d/plugins/*.vim
