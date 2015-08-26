syntax enable
filetype on
filetype indent on
filetype plugin on
set wrap
set shiftround
set linebreak
set showmatch
set ignorecase
set smartcase
set gdefault
set autowrite
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set textwidth=79
set history=20
set fileformat=unix
set foldmethod=indent
set shell=/bin/bash
set encoding=utf-8
set term=ansi
set background=dark

colorscheme solarized

autocmd FileType css set tabstop=2 shiftwidth=2
autocmd FileType tex,txt,xls,tsv,csv set noexpandtab tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType c,cpp set cindent

" Go lang settings
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force reloading
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

" Map leader key
let mapleader = ","
let maplocalleader = ","

nmap <Leader>p  :set invpaste<CR>:set paste?<CR>
nmap <Leader>s  :source ~/.vimrc<CR>
nmap <Leader>v  :e ~/.vimrc<CR>
nmap <Leader>x  :!%<CR>

" remap spacebar to toggle fold in normal mode
nnoremap <space> za

" Pull word under cursor into LHS of a substitute
nmap <Leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#

" Pull Visually Highlighted text into LHS of a substitute
vmap <Leader>z :<C-U>%s/\<<c-r>*\>/

iab jv! Jason Voigt

iab pi! π
iab theta! θ
iab delta! δ
iab Delta! Δ
iab epsilon! ε

iab date! <c-r>=strftime("%Y-%m-%d")<cr>
iab Date! <c-r>=strftime("%d-%b-%Y")<cr>
iab DATE! <c-r>=strftime("%B %d, %Y")<cr>
iab day!  <c-r>=strftime("%a")<cr>
iab Day!  <c-r>=strftime("%A")<cr>
iab time! <c-r>=strftime("%H:%M")<cr>
iab timestamp! <c-r>=strftime("%H:%M %a %d %b %Y")<cr>

" Solarized colors
iab base03! #002b36
iab base02! #073642
iab base01! #586e75
iab base00! #657b83
iab base0! #839496
iab base1! #93a1a1
iab base2! #eee8d5
iab base3! #fdf6e3
iab yellow! #b58900
iab orange! #cb4b16
iab red! #dc322f
iab magenta! #d33682
iab violet! #6c71c4
iab blue! #268bd2
iab cyan! #2aa198
iab green! #859900
