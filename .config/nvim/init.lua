vim.loader.enable()

-- TODO: better document enabled/disabled builtins.
local disabled_builtins = {
--	"clipboard_provider",
--	"gzip",
--	"man", -- man pages are pretty sweet.
--	"netrw",
--	"netrwFileHandlers",
--	"netrwPlugin",
--	"syntax_completion", -- fixes syntax highlighting.
--	"tar", adds tar file traversal
--	"tarPlugin", adds tar file traversal
--	"xmlformat", adds xml formatting with gq
--	"zip", adds zip file traversal
--	"zipPlugin", adds zip file traversal
	"2html_plugin", -- unused
	"dbext", -- unused sql
	"dvorak_plugin", -- disable dvorak mode
	"getscript", -- get vim scripts? ignore
	"getscriptPlugin", -- get vim scripts? ignore
	"less", -- make vim like less, ignore
	"logiPat", -- weird plugin
	"matchit", -- unk
	"matchparen", --unk
	"msgpack_autoload", -- parse msgpack files, unk?
	"netrwSettings", -- unk?
	"node_provider",
	"perl_provider",
	"python3_provider",
	"python_provider",
	"pythonx_provider",
	"remote_plugins",
	"rrhelper",
	"ruby_provider",
	"shada_autoload",
	"shada_plugin",
	"spellfile_plugin",
	"sql_completion",
	"tutor_mode_plugin",
	"vimball", -- unused vimball file format
	"vimballPlugin", -- unused vimball file format
}

for _, plugin in pairs(disabled_builtins) do
	vim.g["loaded_" .. plugin] = 1
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colorscheme pack.
	"karlek/vim-colorschemes",
	-- Great colorscheme.
	"ayu-theme/ayu-vim",

	-- Allow changing inside objects from anywhere on the line.
	"wellle/targets.vim",
	-- Readline insertion keybindings.
	"tpope/vim-rsi",
	-- Surround. Next-generation.
	"kylechui/nvim-surround",
	-- Can't live without, but not perfect.
	"jiangmiao/auto-pairs",
	-- Fix the awkward remove-blackhole-paste issue.
	"vim-scripts/ReplaceWithRegister",

	-- Allow opening files with line number file:47
	"wsdjeg/vim-fetch",

	-- needs: go install golang.org/x/tools/cmd/goimports@latest
	"mattn/vim-goimports",

	{"nvim-treesitter/nvim-treesitter", cmd = "TSUpdate"},
	"neovim/nvim-lspconfig",

	-- Jump to anywhere.
	"smoka7/hop.nvim",

	-- Dependency for everything.
	"nvim-lua/plenary.nvim",
	-- Ctrl-p jump to file.
	"nvim-telescope/telescope.nvim",

	-- Distraction-free-mode / lights-out-mode.
	-- TODO: evaluate these plugins.
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",

	-- Netrw enhancer.
	"tpope/vim-vinegar",

	-- NOTE: random file type support.
	"rhysd/vim-llvm",
	"tikhomirov/vim-glsl",

	-- Excellent highlight of todos, notes, etc.
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
})

-- [ Plugin setup ] --

require("nvim-surround").setup{}
require("todo-comments").setup{}
require'nvim-treesitter.configs'.setup {
	-- A list of parser names
	ensure_installed = { "c", "go", "rust", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
	highlight = {
		enable = true,
		-- ref: https://www.reddit.com/r/neovim/comments/1anj03h/treesitter_failing_to_highlight_markdown/
		-- ref: https://stackoverflow.com/questions/78220353/neovim-no-syntax-highlighting-with-treesitter-for-markdown
		additional_vim_regex_highlighting = { "markdown" },
		-- Disable slow treesitter highlight for large files.
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	indent = {
		enable = true,
	},
}

-- Add tree sitter for asm.
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.arm = {
  install_info = {
    url = "https://github.com/SethBarberee/tree-sitter-asm",
    files = {"src/parser.c"},
    -- optional entries:
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "arm", -- if filetype does not match the parser name
}

-- local lspconfig = require'lspconfig'
-- local lsps = {"zls", "pyright", "gopls", "rust_analyzer", "clangd"}
--
-- for i, lsp in ipairs(lsps) do
-- 	lspconfig[lsp].setup{}
-- end

-- init hop, jump anywhere
require'hop'.setup()

-- init telescope, universal picker
local actions = require("telescope.actions")
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	}
}

-- vim.api.nvim_create_autocmd({'BufWritePre'}, {
-- 	group = vim.api.nvim_create_augroup('format_on_save', {}),
-- 	desc = 'format on save',
-- 	pattern = '<buffer>',
-- 	command = 'silent! lua vim.lsp.buf.format()',
-- })


-- [ / Plugin setup ]

-- Line numbering
vim.opt.number = true

-- Don't redraw while executing macros (good performance config)

vim.opt.lazyredraw = true
-- Enables mouse scrolling
vim.opt.mouse = "a"

-- Enables 24-bit RGB color in the |TUI|.
vim.opt.termguicolors = true

-- Ignore case when searching.
vim.opt.ignorecase = true

-- Switch to case sensitive when having both cases in query.
vim.opt.smartcase = true

-- Highlight line but not column.
vim.opt.cursorline = true

-- Word wraping.
vim.opt.linebreak = true

-- Minimum number of lines surrounding cursor.
vim.opt.scrolloff = 3

-- Don't show the line and column number of the cursor position, separated by
-- a comma.
vim.opt.ruler = false
-- The value of this option influences when the last window will have a
-- status line. 0 == never.
vim.opt.laststatus = 1

-- Tabs should be tabs.
-- set noexpandtab

-- Don't show mode in command-line, because we already show it in the
-- statusbar.
vim.opt.showmode = false

-- Don't insert comments automatically after another comment.
-- c:   Auto-wrap comments using textwidth, inserting the current comment
--      leader automatically.
--
-- r:   Automatically insert the current comment leader after hitting
--      <Enter> in Insert mode.
--
-- o:   Automatically insert the current comment leader after hitting 'o' or
--      'O' in Normal mode.  In case comment is unwanted in a specific place
--      use CTRL-U to quickly delete it. |i_CTRL-U|
vim.opt.formatoptions = "jqlnt"

-- Show tab, end-of-line and trailing whitespaces.
vim.opt.list = true
vim.opt.listchars = {tab = "│ ", trail = "·", lead= "·", nbsp = "◇"}

-- Save undo history between sessions.
vim.opt.undofile = true

-- Write to swap if nothing happens after this duration.
vim.opt.updatetime = 100

--  I   don't give the intro message when starting Vim |:intro|.
--
--  c   don't give |ins-completion-menu| messages.  For example,
--      "-- XXX completion (YYY)", "match 1 of 2", "The only match",
--      "Pattern not found", "Back at original", etc.
vim.o.shortmess = 'filnxtToOFIc'

-- Number of spaces to use for each step of (auto)indent. Used for >> and <<.
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 4
-- Remove four spaces like a tab.
vim.opt.softtabstop = 4
-- When shifting lines (>> & <<), round the indentation to the nearest multiple
-- of `shiftwidth.`
vim.opt.shiftround = true

-- Update the document interactively with `:s`
vim.opt.inccommand = "split"

-- Avoid scrolling when switching buffers.
vim.opt.jumpoptions = "view"

--  Set completeopt to have a better completion experience
vim.opt.completeopt = {"menuone", "noinsert", "noselect"}

vim.opt.spellsuggest = 'best,9'

-- [ Display ] ---

-- Fix syntax coloring for sign and fold column by clearing the highlight groups.
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "FoldColumn", {})
vim.opt.signcolumn = "yes"

vim.opt.background = "dark"
vim.cmd.colorscheme('ayu')

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Highlight selection on yank',
	pattern = '*',
	callback = function(event)
		if vim.v.event.regname == "+" then
			vim.highlight.on_yank { higroup = 'IncSearch', timeout = 1000 }
		else
			vim.highlight.on_yank { higroup = 'Pmenu', timeout = 1000 }
		end
	end,
})

vim.api.nvim_create_autocmd({'BufWinEnter'}, {
	group = vim.api.nvim_create_augroup('last_position', {}),
	desc = 'return cursor to where it was last time closing the file',
	pattern = '*',
	command = 'silent! normal! g`"zv',
})

-- [ / Display ] ---

-- [ Keymap ] ---

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- TODO: Evaluate if actually needed.
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", {desc = "Escape terminal"})

-- Disable command history search.
vim.keymap.set("n", "q:", "<nop>", {desc = "Noop q:"})
-- Disable help key.
vim.keymap.set("n", "<F1>", "<nop>", {desc = "Noop F1"})
vim.keymap.set("i", "<F1>", "<nop>", {desc = "Noop F1"})
-- Print current filename.
vim.keymap.set("n", "<F2>", "<cmd>echo @%<cr>", {desc = "Print filename"})
vim.keymap.set("i", "<F2>", "<cmd>echo @%<cr>", {desc = "Print filename"})

-- Source current file.
vim.keymap.set("n", "<localleader>r", "<cmd>source %<bar>echom 'Sourced!'<cr>", {desc = "Source file"})
vim.keymap.set("n", "<localleader>i", "<cmd>PlugInstall<cr>", {desc = "Install plugins"})
vim.keymap.set("n", "<localleader>c", "<cmd>PlugClean<cr>", {desc = "Remove unused plugins"})
vim.keymap.set("n", "<localleader>u", "<cmd>PlugUpdate<cr>", {desc = "Update plugins"})
vim.keymap.set("n", "<localleader>U", "<cmd>PlugUpgrade<cr>", {desc = "Upgrade vim-plug"})
-- Save current file.
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", {desc = "Save file"})

-- New buffer quick.
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", {desc = "New file"})

-- Change to the alternate file (usually last file).
vim.keymap.set("n", "<leader><leader>", "<c-^>", {desc = "Toggle alternate file"})

-- Clear search highlighting.
vim.keymap.set("n", "<leader>c", "<cmd>nohl<bar>lua vim.lsp.buf.clear_references()<cr>", {silent = true, desc = "Clear highlighting"})

-- Fast window movement
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "Move to the window below"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "Move to the window above"})
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "Move to the left window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "Move to the right window"})

-- Yank and paste to system clipboard.
vim.keymap.set("v", "<leader>y", '"+y', {desc = "Copy to clipboard"})
vim.keymap.set("n", "<leader>y", '"+y', {desc = "Copy to clipboard"})
vim.keymap.set("n", "<leader>p", '"+p', {desc = "Paste from clipboard"})
vim.keymap.set("n", "<leader>P", '"+P', {desc = "Paste clipboard before"})

-- Line motions
-- TODO: consider more hop actions
-- https://github.com/smoka7/hop.nvim#keybindings
vim.keymap.set("n", "<leader>j", '<cmd>HopLineAC<CR>', {desc = "Fast downwards jump to label"})
vim.keymap.set("v", "<leader>j", '<cmd>HopLineAC<CR>', {desc = "Fast downwards jump to label"})
vim.keymap.set("n", "<leader>k", '<cmd>HopLineBC<CR>', {desc = "Fast upwards jump to label"})
vim.keymap.set("v", "<leader>k", '<cmd>HopLineBC<CR>', {desc = "Fast upwards jump to label"})
vim.keymap.set("n", "<leader>f", '<cmd>HopChar1MW<CR>',  {desc = "Fast anywhere jump to label"})

-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

-- Switch buffers.
vim.keymap.set("n", "<C-b>", '<cmd>Telescope buffers<CR>', {desc = "Picker for buffers"})
-- Switch to related header file.
-- vim.keymap.set("n", "<C-5>", '<cmd>ClangdSwitchSourceHeader<CR>', {desc = "Switch between header and source file"})
-- Search for files.
vim.keymap.set("n", "<C-p>", '<cmd>Telescope git_files<CR>', {desc = "Search for files"})

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
vim.keymap.set("n", "n", "nzzzv", {desc = "Next hit (centered)"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Previous hit (centered)"})

-- Insert empty line before or after cursor.
vim.keymap.set("n", "<leader>O", "m`O<Esc>``", {desc = "Insert empty line before cursor"})
vim.keymap.set("n", "<leader>o", "o<Esc>", {desc = "Insert empty line after cursor"})

-- Smarter movement on wrapped lines.
vim.keymap.set("n", "j", "gj", {desc = "Move cursor down one line virtually"})
vim.keymap.set("n", "k", "gk", {desc = "Move cursor up one line virtually"})

-- [ / Keymap ] ---

-- Not yet ported

vim.cmd "cabbr <expr> $$ '~/.config/nvim/init.lua'"
-- Toggle spell-check.
vim.cmd "nnoremap <F3> <cmd>setlocal spell! spelllang=en,sv<CR>"
-- Remove trailing spaces.
vim.cmd "nnoremap <silent> <F4> :let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <Bar> :echo 'Whitespaced trimmed!' <CR>"
