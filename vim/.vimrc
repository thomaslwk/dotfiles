call plug#begin()
	Plug 'tpope/vim-sensible'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Defaults 
syntax enable 
set number relativenumber

" Styling 
set background=dark
colorscheme gruvbox 

" Enable spell checker
setlocal spell

" Enable backspace
set backspace=indent,eol,start

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
