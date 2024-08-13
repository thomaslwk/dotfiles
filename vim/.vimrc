" Plugins 
call plug#begin()
	Plug 'tpope/vim-sensible'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'tomasiser/vim-code-dark'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'machakann/vim-highlightedyank'
call plug#end()

" Defaults 
syntax enable 
set number 
" Fix colour in gnome terminal
set t_Co=256

" Styling 
set background=dark
colorscheme codedark

" Show highlight
let g:highlightedyank_highlight_duration = 3000
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Enable spell checker
setlocal spell

" Enable backspace
set backspace=indent,eol,start

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
