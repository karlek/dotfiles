" lua <<EOF
" require'nvim-treesitter.configs'.setup {
" 	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
" 	highlight = {
" 		enable = true,              -- false will disable the whole extension
" 		disable = {},  -- list of language that will be disabled
" 	},
" 	custom_captures = {
" 		-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
" 		["reciver.parameter_list.parameter_decleration.identifier"] = "Identifier",
" 	},
" }
" require "nvim-treesitter.configs".setup {
" 	query_linter = {
" 		enable = true,
" 		use_virtual_text = true,
" 		lint_events = {"BufWrite", "CursorHold"},
" 	},
" }
" EOF
