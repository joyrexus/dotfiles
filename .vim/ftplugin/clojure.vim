" Language:    Clojure

" ,r  run/eval code within innermost block
nmap <LocalLeader>r cpp<CR>
" ,R  run/eval code within outermost block
nmap <LocalLeader>R :Eval<CR>

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

