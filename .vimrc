let mapleader = " "
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set hidden
set noerrorbells
set nowrap
set incsearch
set nohlsearch
set noshowmode
set encoding=UTF-8
set nocompatible
set termguicolors
syntax on

" Set the cursor shape 
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Install vim-plug and all my plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sheerun/vim-polyglot'
    Plug 'sainnhe/sonokai'
    Plug 'tpope/vim-fugitive'
call plug#end()

" VIM SONOKAI CONFIG
colorscheme sonokai

" VIM AIRLINE CONFIG
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='onedark'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty=''

" VIM ONEDARK CONFIG
let g:onedark_termcolors=256
" colorscheme onedark


" VIM ON TMUX COLOR CONFIG
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
