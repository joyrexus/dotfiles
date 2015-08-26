" Language: scheme

ab bang! #!/usr/bin/env scheme

" ,r  run/execute code in file (faster to type than ,x)
" ,v  run w/ verbose output 
nmap <LocalLeader>r  :!scheme --silent < %<CR>
nmap <LocalLeader>v  :!scheme < %<CR>

" :<RANGE>R  run/execute specified line range
command! -range=% -bar R <line1>,<line2>:w !scheme --silent
