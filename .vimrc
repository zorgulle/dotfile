execute pathogen#infect()
filetype plugin indent on
set autoindent
set smartindent
syntax on

colorscheme wombat256
set background=dark

let mapleader=","

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
nnoremap <C-e> <Esc>$
nnoremap <C-a> <Esc>^


inoremap <Esc> <Nop>
inoremap jk <Esc>


"CONFIG POWERLINE
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors

"TAB
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


set textwidth=79
set wrap linebreak nolist

" Show indent and ending whitespace
set list
set listchars=tab:>.,trail:.,nbsp:.
set backspace=indent,eol,start

nnoremap <leader>des :%s/\s\+$//<Cr>:w<Cr> "Delete ending whitespace

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

autocmd BufNewFile *.py so $HOME/.vim/py_header.txt
autocmd BufNewFile *.py exe "% s/\\(.*date.*\\)/\\1 '" .strftime("%d-%m-%Y") ."'"
autocmd BufNewFile *.py exe "normal! G"
