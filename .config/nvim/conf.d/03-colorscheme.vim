set background=dark

" Other great colorschemes:
" evening, pride, badwolf, PaperColor
colorscheme PaperColor 

let g:lightline = { 'colorscheme': 'seoul256' }

let s:switch = 1
fun! s:Bright()
      if s:switch
            set background=light
            " colorscheme PaperColor
            let g:lightline.colorscheme = 'PaperColor'

            let s:switch = 0
      else
            set background=dark
            " colorscheme PaperColor
            let g:lightline.colorscheme = 'seoul256'

            let s:switch = 1
      end
      " Secondly tell the lightline to load the settings of g:lightline
      call lightline#init()

      " Thirdly generate the colors based on the value of g:lightline.colorscheme
      call lightline#colorscheme()

      " Lastly update all the statusline of the windows
      call lightline#update()
endf
command! Bright :call s:Bright()
