lua << EOF
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local opts = { noremap=true }

	-- TODO: Fix better keys for these.
	-- vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
	-- vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)
	-- vim.api.nvim_set_keymap('n', 'gr',         '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
	-- vim.api.nvim_set_keymap('n', 'K',          '<cmd>lua vim.lsp.buf.hover()<CR>',           opts)
	vim.api.nvim_set_keymap('n', 'gd',         '<cmd>lua vim.lsp.buf.definition()<CR>',      opts)

	-- vim.api.nvim_set_keymap('n', '<leader>D',  '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- Not needed since we have `gr`
	-- vim.api.nvim_set_keymap('n', 'gi',         '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)

	-- local bufopts = { noremap=true, silent=true, buffer=bufnr }
	-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.code_action, bufopts)

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local servers = { 'pyright', 'rust_analyzer', 'zls', 'tsserver', 'gopls' }
	for _, lsp in pairs(servers) do
		require('lspconfig')[lsp].setup {
			on_attach = on_attach,
			flags = {
				-- This will be the default in neovim 0.7+
				debounce_text_changes = 150,
			},
			capabilities = capabilities
		}
	end

	require'lspconfig'.hls.setup{
		root_dir = vim.loop.cwd,
	}

	require'lspconfig'.clangd.setup{
		cmd = { "clangd", "-log=verbose" },
	}

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		float = { border = "single" },
	})

	vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope = "cursor"})]])
EOF
