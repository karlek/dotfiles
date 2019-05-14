" Using these keybindings:

" [<Space>  Add [count] blank lines above the cursor.
" ]<Space>  Add [count] blank lines below the cursor.

" Investigating these keybindings:

" [f        Go to the file preceding the current one alphabetically in the current file's directory.  
" ]f        Go to the file succeeding the current one alphabetically in the current file's directory.  
" [n        Go to the previous SCM conflict marker or diff/patch hunk. Try d[n inside a conflict.  
" ]n        Go to the next SCM conflict marker or diff/patch hunk. Try d]n inside a conflict.  
" [a        :previous
" ]a        :next
" [A        :first
" ]A        :last
" [b        :bprevious
" ]b        :bnext
" [B        :bfirst
" ]B        :blast
" [l        :lprevious
" ]l        :lnext
" [L        :lfirst
" ]L        :llast
" [<C-L>    :lpfile
" ]<C-L>    :lnfile
" [q        :cprevious
" ]q        :cnext
" [Q        :cfirst
" ]Q        :clast
" [<C-Q>    :cpfile (Note that <C-Q> only works in a terminal if you disable
" ]<C-Q>    :cnfile flow control: stty -ixon)
" [t        :tprevious
" ]t        :tnext
" [T        :tfirst
" ]T        :tlast
" [<C-T>    :ptprevious
" ]<C-T>    :ptnext
" [x        XML encode.  <foo bar="baz"> => &lt;foo bar=&quot;baz&quot;&gt;
" ]x        XML decode.  HTML entities are handled as well.
" [u        URL encode.  foo bar => foo%20bar
" ]u        URL decode.
" [y        C String encode.  Backslash escape control characters, quotation marks, and backslashes.
" ]y        C String decode.

" Ignoring these keybindings:
let g:nremap = {
\ ']p': '',
\ '[p': '',
\ '[P': '',
\ ']P': '',
\ '>p': '',
\ '>P': '',
\ '<p': '',
\ '<P': '',
\ '=p': '',
\ '=P': '',
\ '[e': '',
\ ']e': '',
\ '[ob': '',
\ ']ob': '',
\ 'yob': '',
\ '[oc': '',
\ ']oc': '',
\ 'yoc': '',
\ '[od': '',
\ ']od': '',
\ 'yod': '',
\ '[oh': '',
\ ']oh': '',
\ 'yoh': '',
\ '[oi': '',
\ ']oi': '',
\ 'yoi': '',
\ '[ol': '',
\ ']ol': '',
\ 'yol': '',
\ '[on': '',
\ ']on': '',
\ 'yon': '',
\ '[or': '',
\ ']or': '',
\ 'yor': '',
\ '[os': '',
\ ']os': '',
\ 'yos': '',
\ '[ou': '',
\ ']ou': '',
\ 'you': '',
\ '[ov': '',
\ ']ov': '',
\ 'yov': '',
\ '[ow': '',
\ ']ow': '',
\ 'yow': '',
\ '[ox': '',
\ ']ox': '',
\ 'yox': '',
\ '[op': '',
\ ']op': '',
\ 'yop': '',
\ }
