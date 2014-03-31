execute pathogen#infect()
filetype plugin indent on
set autoindent
set smartindent
syntax on

colorscheme wombat256

set background=dark
set number

let mapleader = ","

inoremap  {     {}<Left>
inoremap  {<CR> {<CR>}<Esc>O
inoremap  {{    {
inoremap  {}    {}


nnoremap <Tab> %
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
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop

set list
set listchars=tab:>.,trail:.,nbsp:.
set backspace=indent,eol,start

nnoremap <leader>des :%s/\s\+$//<Cr>:w<Cr>

map <c-h>
map <c-j>
map <c-k>
map <c-l>

