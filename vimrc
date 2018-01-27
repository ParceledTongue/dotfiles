" vim-plug
call plug#begin()
Plug 'dracula/vim'
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()

" colors
color dracula

" vim-markdown-preview
let vim_markdown_preview_github=1 " use github-style markdown

" misc.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start
set number
set cursorline
set showmatch
set incsearch
set linebreak

