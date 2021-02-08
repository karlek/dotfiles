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
Plug 'ctrlpvim/ctrlp.vim'                                                     " Switch buffer plugin

" Not fundamental
Plug 'tpope/vim-repeat'                                                       " Repeat complex motions such as vim-surround
Plug 'tpope/vim-surround'                                                     " Can't, live without, but not perfect.
Plug 'jiangmiao/auto-pairs'                                                   " Auto pairs, can't live without, but not perfect.

" Languages
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}                       " Better semantic highlighting for Python

" Extra
" Plug 'tpope/vim-unimpaired'                                                   " TODO: re-evaluate the need. Many shortcuts
" Plug 'junegunn/limelight.vim'                                                 " Zen-mode
" Plug 'junegunn/goyo.vim'                                                      " Zen-mode
"
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf.vim'

call plug#end()                                                               " required

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.clear_references()<CR><cmd>lua vim.lsp.buf.document_highlight()<CR>

nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

nnoremap <leader>dn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen
	else
		cclose
	endif
endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>

" incoming_calls()                                *vim.lsp.buf.incoming_calls()*
" implementation()                                *vim.lsp.buf.implementation()*
" outgoing_calls()                                *vim.lsp.buf.outgoing_calls()*
" rename({new_name})                                      *vim.lsp.buf.rename()*
" signature_help()                                *vim.lsp.buf.signature_help()*
" type_definition()                              *vim.lsp.buf.type_definition()*
" goto_next({opts})                             *vim.lsp.diagnostic.goto_next()*
" goto_prev({opts})                             *vim.lsp.diagnostic.goto_prev()*

" Makes s (along with corresponding maps for ss and S) act like d, except it
" doesn’t save the cut text to a register. Helps when I want to delete
" something without clobbering my unnamed register.
" nnoremap s "_d

autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
" autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

runtime! neo-conf.d/plugins/*
