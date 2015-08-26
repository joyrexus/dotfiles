" Language:    Javascript
" Maintainer:  J. Voigt

ab bang! #!/usr/bin/env node
ab p! console.log

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nmap <LocalLeader>r  :!node %<CR>
command! -range=% -bar R <line1>,<line4>:w !node
