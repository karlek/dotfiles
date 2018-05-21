if exists("did_load_filetypes")
    finish
endif

autocmd BufRead *.mips set ft=mips
autocmd BufRead *.m set ft=matlab

augroup filetypedetect
    au! BufRead,BufNewFile *.conf setfiletype config
augroup END
