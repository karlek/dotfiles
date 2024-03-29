lua << EOF
require'nvim-treesitter.configs'.setup {
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "all",

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,

		-- NOTE: these are the names of the parsers and not the filetype. (for
		-- example if you want to disable highlighting for the `tex` filetype, you
		-- need to include `latex` in this list as this is the name of the parser) --
		-- list of language that will be disabled
		disable = function(_, bufnr)
			local buf_name = vim.api.nvim_buf_get_name(bufnr)
			local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
			return file_size > 50 * 1024
		end,
	},
	indent = {
		enable = true,
		disable = {"python", "yaml"},
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 10000, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = false,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "gR",
			},
		},
	},
}

EOF

" set omnifunc=v:lua.vim.lsp.omnifunc
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
"
