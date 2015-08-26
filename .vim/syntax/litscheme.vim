" Language:   Literate Scheme

if exists('b:current_syntax') && b:current_syntax == 'litscheme'
  finish
endif

runtime! syntax/markdown.vim
unlet b:current_syntax

syn clear markdownCode

syn include @scheme /usr/share/vim/vim73/syntax/scheme.vim

syn region inlineScheme start='^    \|\t' end='$' contains=@scheme

let b:current_syntax = "litscheme"

