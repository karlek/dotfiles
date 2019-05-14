" Tell Vim what external program to use for grepping.
" I use the silver searcher, but you can use ripgrep or whatever works for you.
let &grepprg='rgvim ' . expand('%:p:h')

" Open the location/quickfix window automatically if there are valid entries in the list.
" I actually use a more generic and more useful version of this snippet that works for
" every quickfix command, not just these ones.
augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

" Use :Grep instead of :grep! and :LGrep instead of :lgrep!.
" :cgetexpr and :lgetexpr are much faster than :grep and :lgrep
" and they don't mess with your terminal emulator.
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr system(&grepprg . ' ' . shellescape(<q-args>))
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr system(&grepprg . ' ' . shellescape(<q-args>))
