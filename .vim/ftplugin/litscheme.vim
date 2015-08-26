" Language: Literate Scheme
 
ab bang! #!/usr/bin/env scheme

" ,r  run/execute code in file (faster to type than ,x)
" ,x  run/execute code in file verbosely
" ,m  show resulting markup 
" ,v  view file as rendered markdown in a browser 
nmap <LocalLeader>r  :!grep "^    " % \| sed 's/^    //' \| scheme --silent<CR>
nmap <LocalLeader>x  :!grep "^    " % \| sed 's/^    //' \| scheme<CR>
nmap <LocalLeader>m  :!marked %<CR>
nmap <LocalLeader>v  :!marko % \| browser<CR>
 
" :<RANGE>R  run/execute specified line range
" :<RANGE>M  show resulting markup of specified line range
" :<RANGE>V  view specified line range as rendered markdown in a browser
command! -range=% -bar R <line1>,<line2>:w !sed 's/^    //' | scheme --silent
command! -range=% -bar M <line1>,<line2>:w !marked
command! -range=% -bar V <line1>,<line2>:w !marked | browser
 
if exists("b:did_ftplugin")
  finish
endif
 
let b:did_ftplugin = 1
