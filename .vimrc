let mapleader = " "
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
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
set backspace=indent,eol,start
syntax on

" My custom keymaps
nnoremap G Gzz
nnoremap H Hzz
nnoremap L Lzz

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

    " AUTOCOMPLETION
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " WHICH KEY
    Plug 'liuchengxu/vim-which-key'

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

    " FORMAT ON SAVE (PRETTIER)
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

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
" let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#battery#enabled = 0
let g:airline#extensions#bookmark#enabled = 0



" VIM AUTO CLOSETAG CONFIG
let g:closetag_filenames = '*.html,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,jsx,tsx'



" VIM AUTOCOMPLETION CONFIG
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rename variable
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" coc-lsp 
let g:coc_global_extensions = [
    \'coc-css',
    \'coc-emmet',
    \'coc-html',
    \'coc-json',
    \'coc-tsserver',
\]



" VIM NERDTREE CONFIG
nnoremap <Leader>e :NERDTreeToggle<CR>



" VIM FZF CONFIG
nnoremap <Leader><Space> :Buffers<CR>
nnoremap <Leader>sf :Files<CR>



" WHICH KEY CONFIG
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>



" VIM FUGITIVE CONFIG
nnoremap <leader>gs :Gvdiffsplit<CR>



" VIM FORMATTER CONFIG
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync


" VIM ON TMUX COLOR CONFIG
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" CUSTOM TAB SPACES
filetype plugin indent on
au BufNewFile,BufRead *.tsx, *.js, *.jsx, *.json, *.md, *.html, *.css, *.graphql, *.gql
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2
au BufNewFile,BufRead *.py
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
