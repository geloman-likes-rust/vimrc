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
set timeout
set timeoutlen=300
set updatetime=250
set signcolumn=yes
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

" VIM-PLUGINS
call plug#begin('~/vim/plugged')
    " FILETREE
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " VIMLINE
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " FUZZY FINDER
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " VIM LANGUAGE PACK
    Plug 'sheerun/vim-polyglot'

    " GIT TOOL
    Plug 'tpope/vim-fugitive'

    " GIT SIGN
    Plug 'airblade/vim-gitgutter'

    " AUTO PAIRS & AUTO CLOSETAG
    Plug 'jiangmiao/auto-pairs'
    Plug 'alvan/vim-closetag'

    " ADJUSTS 'SHIFTWIDTH' AND 'EXPANDTAB' AUTOMATICALLY 
    Plug 'tpope/vim-sleuth'

    " PLUGIN FOR ICONS
    Plug 'ryanoasis/vim-devicons'

    " COLORSCHEMES
    Plug 'joshdick/onedark.vim'
    Plug 'sainnhe/sonokai'
    Plug 'morhetz/gruvbox'

call plug#end()

" VIM SONOKAI CONFIG
" colorscheme sonokai

" VIM GRUVBOX CONFIG
colorscheme gruvbox
set background=dark

" g:gruvbox_contrast = hard | medium | soft
let g:gruvbox_contrast_dark = 'medium'

" g:gruvbox_transparent_bg = 0 | 1 
let g:gruvbox_transparent_bg = 1

" VIM ONEDARK CONFIG
let g:onedark_termcolors=256
" colorscheme onedark

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

" VIM AUTO CLOSETAG CONFIG
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,jsx,tsx'

" VIM NERDTREE CONFIG
nnoremap <Leader>e :NERDTreeToggle<CR>

" VIM FZF CONFIG
nnoremap <Leader><Space> :Buffers<CR>

" VIM ON TMUX COLOR CONFIG
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
