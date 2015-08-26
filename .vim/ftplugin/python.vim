" Language:    Python
" Maintainer:  J. Voigt

ab bang! #!/usr/bin/env python

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal comments=:#
setlocal commentstring=#\ %s

let python_highlight_all=1
syntax on

nmap <LocalLeader>r  :!python %<CR>
nmap <LocalLeader>t  :!nosetests %<CR>
command! -range=% -bar R <line1>,<line2>:w !python -

if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1
