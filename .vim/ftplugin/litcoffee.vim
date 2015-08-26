" Language: Literate CoffeeScript
 
ab bang! #!/usr/bin/env coffee
ab p! console.log

setlocal commentstring=>\ %s
 
" ,r  run/execute code in file (faster to type than ,x)
" ,j  show resulting javascript
" ,m  show resulting markup 
" ,v  view file as rendered markdown in a browser 
nmap <LocalLeader>r  :!coffee %<CR>
nmap <LocalLeader>j  :!coffee -p %<CR>
nmap <LocalLeader>m  :!marked %<CR>
nmap <LocalLeader>v  :!marko % \| browser<CR>
 
" :<RANGE>R  run/execute specified line range
" :<RANGE>J  show resulting javascript of specified line range
" :<RANGE>M  show resulting markup of specified line range
" :<RANGE>V  view specified line range as rendered markdown in a browser
command! -range=% -bar R <line1>,<line2>:w !coffee -s
command! -range=% -bar J <line1>,<line2>:w !coffee -sp
command! -range=% -bar M <line1>,<line2>:w !marked
command! -range=% -bar V <line1>,<line2>:w !marked | browser
 
if exists("b:did_ftplugin")
  finish
endif
 
let b:did_ftplugin = 1
