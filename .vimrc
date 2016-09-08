set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"""Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"""Syntax checker
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

set autoindent
set smartindent
syntax on

set background=dark

let mapleader=","

"See You Esc key
inoremap <Esc> <Nop>
inoremap jk <Esc>

"Bye Bye Ex mode
noremap Q <Nop>


"TAB
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" Show indent and ending whitespace
set list
set listchars=tab:>.,trail:.,nbsp:.
set backspace=indent,eol,start

nnoremap <leader>des :%s/\s\+$//<Cr>:w<Cr> "Delete ending whitespace

map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

"Status line 
let g:airline#extensions#tabline#enabled = 1

"Syntax checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
