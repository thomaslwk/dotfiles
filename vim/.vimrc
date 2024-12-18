" ---------------------------------------------------
" Plugins
" ---------------------------------------------------
call plug#begin()
	Plug 'tpope/vim-sensible'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark'
	Plug 'machakann/vim-highlightedyank'
call plug#end()
" ---------------------------------------------------

" ---------------------------------------------------
" Defaults 
" ---------------------------------------------------
syntax enable
set number          " Show line numbers
setlocal spell		" Set spell checker
set background=dark

" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1

" Do not use relative numbers to where the cursor is.
set relativenumber

" Apply the indentation of the current line to the next line.
set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set nrformats-=octal

" Enable backspace
set backspace=indent,eol,start
set shiftround

" ---------------------------------------------------
" Keymapping
" ---------------------------------------------------
" Set jk as escape key 
inoremap jk <Esc>

" Show highlight
let g:highlightedyank_highlight_duration = 3000
highlight HighlightedyankRegion cterm=reverse gui=reverse

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<Cr>

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='angr'
