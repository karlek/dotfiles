call plug#begin('~/.local/share/nvim/plugged')

" Apperance
Plug 'karlek/vim-colorschemes'                                                " Colorscheme pack
Plug 'machakann/vim-highlightedyank'                                          " Temporarily highlight yanked selection
Plug 'itchyny/lightline.vim'                                                  " Lightline status line
Plug 'kshenoy/vim-signature'                                                  " Vim marker sidebar

" Functionality
Plug 'tpope/vim-vinegar'                                                      " Netrw enhancer.
Plug 'tpope/vim-rsi'                                                          " Readline insertion keybindings
Plug 'ctrlpvim/ctrlp.vim'                                                     " Switch buffer plugin
Plug 'easymotion/vim-easymotion', { 'on': '<Plug>(easymotion' }               " Easy motion (vimfx)
Plug 'tpope/vim-commentary'                                                   " Toggle comments plugin
Plug 'jiangmiao/auto-pairs'                                                   " Auto pairs

" Languages
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}                       " Better semantic highlighting for Python

" Test zone
Plug 'machakann/vim-sandwich'

call plug#end()                                                               " required

runtime! neo-conf.d/plugins/*
