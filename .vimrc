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

"Fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'jnurmine/Zenburn'


"NERDTRee
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

set autoindent
set smartindent
syntax on
set t_Co=256

set background=light
colorscheme zenburn

"disable mouse
set mouse=

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


"NERDTree
noremap <F2> <ESC>:NERDTreeToggle<CR>


" FZF
" ----------------------------------

nmap <silent> <c-p> :FZF<CR>




nnoremap <silent> <Leader>C :call fzf#run({
			\   'source':
			\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
			\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
			\   'sink':    'colo',
			\   'options': '+m',
			\   'left':    30
			\ })<CR>



function! s:buflist()
	redir => ls
	silent ls
	redir END
	return split(ls, '\n')
endfunction



function! s:bufopen(e)
	execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction



nnoremap <silent> <Leader><Enter> :call fzf#run({
			\ 'source':  reverse(<sid>buflist()),
			\ 'sink':    function('<sid>bufopen'),
			\ 'options': '+m',
			\ 'down':    len(<sid>buflist()) + 2
			\ })<CR>



command! FZFMru call fzf#run({
			\ 'source':  reverse(s:all_files()),
			\ 'sink':    'edit',
			\ 'options': '-m -x +s',
			\ 'down':    '40%' })



function! s:all_files()
	return extend(
				\ filter(copy(v:oldfiles),
				\        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
				\ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction
