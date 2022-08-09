augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" Return to last edit position when opening files.
" :help last-position-jump
augroup LastPosition
	autocmd!
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
	\ |   exe "normal! g`\""
	\ | endif
augroup END

lua<<EOF
trailspace_trim = function()
  if vim.bo.filetype == "markdown" then
    return
  end

  -- Save cursor position to later restore
  local curpos = vim.api.nvim_win_get_cursor(0)

  -- Search and replace trailing whitespace
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.api.nvim_win_set_cursor(0, curpos)
end
EOF

augroup StripTrailingWhiteSpace
	autocmd!
	autocmd BufWritePre * lua trailspace_trim()
augroup END
