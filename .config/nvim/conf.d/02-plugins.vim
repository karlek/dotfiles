call plug#begin('~/.local/share/nvim/plugged')

" Apperance
Plug 'karlek/vim-colorschemes'                                         " Colorscheme pack
Plug 'nvim-lualine/lualine.nvim'                                       " Statusbar.
" Plug 'kshenoy/vim-signature'                                           " Vim marker sidebar
Plug 'chentoast/marks.nvim'

Plug 'ayu-theme/ayu-vim'
Plug 'mvpopuk/inspired-github.vim'

" Fundamental
Plug 'tpope/vim-vinegar'                                               " Netrw enhancer.
Plug 'wellle/targets.vim'                                              " Allow changing inside objects from anywhere on the line.
Plug 'tpope/vim-rsi'                                                   " Readline insertion keybindings
Plug 'aznhe21/hop.nvim', { 'branch': 'fix-some-bugs'}                  " Jump to anywhere.

Plug 'tpope/vim-commentary'                                            " Toggle comments plugin
Plug 'JoosepAlviste/nvim-ts-context-commentstring'                     " Treesitter aware commentstring, fixes html/js, vim/lua, etc

" Not fundamental
Plug 'tpope/vim-repeat'                                                " Repeat complex motions such as vim-surround
Plug 'tpope/vim-surround'                                              " Can't live without, but not perfect.
Plug 'jiangmiao/auto-pairs'                                            " Can't live without, but not perfect.
Plug 'junegunn/vim-easy-align'                                         " Align characters, addictive.
Plug 'wsdjeg/vim-fetch'                                                " Allow opening files with line number file:47

" Extra
Plug 'folke/zen-mode.nvim'                                             " Zen-mode
Plug 'folke/twilight.nvim'                                             " Only highlight lines near cursor.

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}            " Improved syntax highlighting engine.
Plug 'neovim/nvim-lspconfig'                                           " Enable LSP features.

" Languages
Plug 'mattn/vim-goimports'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'rhysd/vim-llvm'
Plug 'neovimhaskell/haskell-vim'
Plug 'ziglang/zig.vim'

Plug 'luukvbaal/stabilize.nvim'                                        " Buffer stays in-place while opening quickfix / location list.

Plug 'nvim-telescope/telescope.nvim'                                   " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'                                           " Telescope dependency.
Plug 'BurntSushi/ripgrep'                                              " Ripgrep plugin for telescope

Plug 'lukas-reineke/indent-blankline.nvim'                             " Visualize indentation levels.
Plug 'lewis6991/gitsigns.nvim'                                         " Clean git add/removed/modified signs.
" Plug 'ludovicchabant/vim-gutentags'                                    " Automatically generate tags file.
Plug 'rhysd/conflict-marker.vim'                                       " Highlight git conflict markers
Plug 'p00f/nvim-ts-rainbow'                                            " Rainbow parentheses.
Plug 'nacro90/numb.nvim'                                               " Preview line jumps, i.e. :123
Plug 'vim-scripts/ReplaceWithRegister'                                 " Fix the awkward remove-blackhole-paste issue.

Plug 'mbbill/undotree'
Plug 'windwp/nvim-ts-autotag'
Plug 'ray-x/go.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" ~/.local/share/nvim/plugged/nvim-cmp/lua/cmp/config
" diff --git a/lua/cmp/config/compare.lua b/lua/cmp/config/compare.lua
" index 318e527..cef7c51 100644
" --- a/lua/cmp/config/compare.lua
" +++ b/lua/cmp/config/compare.lua
" @@ -129,6 +129,9 @@ compare.locality = setmetatable({
"          local locality_map = {}
"          local regexp = vim.regex(config.completion.keyword_pattern)
"          while buffer ~= '' do
" +          if string.len(buffer) > 1000 then
" +            return locality_map
" +          end
"            local s, e = regexp:match_str(buffer)
"            if s and e then
"              local w = string.sub(buffer, s + 1, e)
Plug 'hrsh7th/cmp-cmdline'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'folke/trouble.nvim'

Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'monkoose/matchparen.nvim'

call plug#end()                                                        " Required.

runtime! conf.d/plugins/*.vim

lua << EOF
	require("trouble").setup {
		icons = false,
	}
	require('nvim-ts-autotag').setup()

	require('go').setup()

	vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
EOF

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<F7>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
	enabled = function()
		return vim.api.nvim_buf_get_option(0, 'modifiable')
	end,
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

require'marks'.setup {
	default_mappings = false,
	mappings = {
		set = "m",
		delete = "dm",
		next = "m]",
		prev = "m[",
	}
}
EOF
