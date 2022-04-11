lua << EOF
require("zen-mode").setup {
	window = {
		backdrop = 1.00, 
		width = 0.50,
		height = 1,
	},
	options = {
		signcolumn = "no",        -- Disable signcolumn
		number = false,           -- Disable number column
		foldcolumn = "0",         -- Disable fold column
		list = false,             -- Disable whitespace characters
		-- cursorline = false,    -- Disable cursorline
		-- cursorcolumn = false,  -- Disable cursor column
	},
	plugins = {
		-- enable to start Twilight when zen mode opens
		twilight = {
			enabled = false
		},
	},
}
EOF
