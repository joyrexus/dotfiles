" Language:    HTML
" Maintainer:  J. Voigt

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2 

nmap <LocalLeader>r  :!open %<CR>
command! -range=% -bar R <line1>,<line2>:w !browser
