if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	echom 'Install vim-plug!'
	echom 'https://github.com/junegunn/vim-plug#unix-1'
	echom ':UpdateRemotePlugins'
	echom ':PlugUpdate'
	echom ':PlugUpgrade'
else
	runtime! conf.d/*.vim
endif
