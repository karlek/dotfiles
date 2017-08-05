if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	echom "Install vim-plug!"
	echom "https://github.com/junegunn/vim-plug#unix-1"
else
	set runtimepath+=$XDG_CONFIG_HOME/nvim
	runtime! conf.d/*
endif
