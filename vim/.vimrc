" ---------------------------------------------------
" Plugins
" --------------------------------------------------
call plug#begin()
	Plug 'tpope/vim-sensible'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
    Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'machakann/vim-highlightedyank'
call plug#end()
" ---------------------------------------------------

" ---------------------------------------------------
"  Defaults
" ---------------------------------------------------
" Enable 24-bit color support for the terminal
set termguicolors

" Set dark theme
" set bg=dark

" Enable syntax highlighting
syntax enable

" Display line numbers
set number

" Enable spell checking
setlocal spell

" Enable wrapping for long lines and set the maximum text width to 80 characters
set wrap
set textwidth=80
set formatoptions=qrn1

" Enable relative line numbers only in normal mode (disables in insert mode)
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

" Enable automatic indentation and smart indentation
set autoindent
set smartindent

" Set filetype to help (this will override the filetype automatically when opening help files)
set ft=help

" Disable completion with the 'i' flag (used for inserting text)
set complete-=i

" Show matching parentheses, brackets, and braces when the cursor is over one
set showmatch

" Enable smart tab behavior (uses spaces instead of tabs for indentation)
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Disable octal number format
set nrformats-=octal

" Enable backspace behavior in insert mode (allows backspacing over indentation, end-of-line, and start of line)
set backspace=indent,eol,start

" Enable rounding of indentation in insert mode
set shiftround

" ---------------------------------------------------
" Keymapping
" ---------------------------------------------------
" Map 'jk' to Escape in insert mode (useful for avoiding the awkward ESC key)
inoremap jk <Esc>

" Set up highlighting for recently yanked text for 3 seconds
let g:highlightedyank_highlight_duration = 3000
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Map F5 to remove all trailing whitespace from the current line or the entire buffer
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Provide feedback after trailing whitespace removal
autocmd TextYankPost * if v:event.operator == 'y' && v:event.regname == '' | echo "Trailing whitespace removed!" | endif

" Nerdtree toggle (Open/Close NERDTree file explorer with Ctrl+e)
nnoremap <C-e> :NERDTreeToggle<Cr>

" ---------------------------------------------------
" Theme
" ---------------------------------------------------
" Enable the tabline in vim-airline for showing tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme ='gruvbox'

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


