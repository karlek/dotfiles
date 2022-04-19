lua << END
local custom_horizon = require'lualine.themes.horizon'

-- Change the background of lualine_c section for inactive splits
custom_horizon.normal.c.bg   = '#242321'
custom_horizon.insert.c.bg   = '#242321'
custom_horizon.visual.c.bg   = '#242321'
custom_horizon.replace.c.bg  = '#242321'
custom_horizon.command.c.bg  = '#242321'

custom_horizon.inactive.c.fg = '#d9cec3'

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = custom_horizon,
		component_separators = '',
		section_separators = '',
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'location'}
	},
}

END

