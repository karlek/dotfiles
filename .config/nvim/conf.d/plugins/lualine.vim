lua << END

local custom_horizon = require'lualine.themes.horizon'

-- Change the background of lualine_c section for inactive splits
custom_horizon.normal.c.bg   = '#242321'
custom_horizon.insert.c.bg   = '#242321'
custom_horizon.visual.c.bg   = '#242321'
custom_horizon.replace.c.bg  = '#242321'
custom_horizon.command.c.bg  = '#242321'

custom_horizon.inactive.c.fg = '#d9cec3'

theme = ayu_light
if vim.api.nvim_get_option('background') == 'dark' then
	print('Dark background detected')
	if vim.g.colors_name == 'ayu' then
		print('Ayu detected')
		theme = ayu_dark
	elseif vim.g.colors_name == 'badwolf' then
		print('Bad wolf detected')
		theme = custom_horizon
	else
		theme = ayu_dark
	end
else
	print('Light background detected')
	theme = ayu_light
end

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = theme,
		-- theme = custom_horizon,
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

