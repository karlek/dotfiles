syntax on

" Fix syntax coloring for sign and fold column.
highlight clear SignColumn
highlight clear FoldColumn
set signcolumn=yes

" Waiting for alacritty merge.
" highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline

lua<<EOF
local async = require("plenary.async")
async.run(function ()
	local pipe = io.popen('grep -P "^colors: \\*light" ~/.config/alacritty/alacritty.yml')
	local output = pipe:read('*all')
	print(output)
	if output == "" then
		--	colorscheme badwolf
		print('dark')
		vim.o.background = "dark"
		vim.cmd('highlight IndentBlanklineChar guifg=#444444 gui=nocombine')
		vim.cmd('colorscheme ayu')
	else
		print('light')
		vim.o.background = "light"
		vim.cmd('let ayucolor="light"')
		vim.cmd('highlight IndentBlanklineChar guifg=#dddddd gui=nocombine')
		vim.cmd('colorscheme ayu')
		vim.cmd('highlight Todo guibg=#e03050')
		-- vim.cmd('highlight Todo guibg=#efdfaf')
		vim.cmd('highlight SignatureMarkText guifg=#0f3f3f gui=bold')
	end
end)
EOF

" TODO
