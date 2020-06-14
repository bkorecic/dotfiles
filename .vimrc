""""""""""""""""""""""""""""""""
" __   _(_)_ __ ___  _ __ ___  "
" \ \ / / | '_ ` _ \| '__/ __| "
"  \ V /| | | | | | | | | (__  "
"   \_/ |_|_| |_| |_|_|  \___| "
"                              "
""""""""""""""""""""""""""""""""

" Automatic vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Runtime path and initialize
set rtp+=$HOME/.vim/
call plug#begin('$HOME/.vim/plugged')

""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""

" surround.vim
Plug 'tpope/vim-surround'

" vimtex
Plug 'lervag/vimtex'

" vim-airline
Plug 'vim-airline/vim-airline'
let g:airline_theme = 'violet'

" vim-closer
Plug 'rstacruz/vim-closer'

" vim-smooth-scroll
Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_impulse_multiplier = 2.0  " Feel free to increase/decrease this value.
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0

" UltiSnips
Plug 'SirVer/ultisnips'

" vim-highlightedyank
Plug 'machakann/vim-highlightedyank'

" ALE
Plug 'dense-analysis/ALE'
let g:ale_set_highlights = 0

" vim-css-color
Plug 'ap/vim-css-color'

" All plugins must be added before
" the following line
call plug#end()
filetype plugin indent on

""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""
" utf-8
set encoding=utf-8
" Use system clipboard
set clipboard=unnamedplus
" Enable syntax highlighting
syntax enable
" Enable backspace
set backspace=indent,eol,start

set ruler

let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1

""""""""""""""""""""""""""""""
" Text, tab, indent
""""""""""""""""""""""""""""""
" Spaces instead of tab
set expandtab

" Tab width
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
set smartindent
set smarttab
set shiftround

""""""""""""""""""""""""""""""
" Lines
""""""""""""""""""""""""""""""
" Show line number
set number

" Set relative line number
set relativenumber

set showmatch
set hlsearch

" Turn on line wrapping
set wrap

" Make j and k move to next row,
" not file line. Useful when wrapping is on
nnoremap j gj
nnoremap k gk

""""""""""""""""""""""""""""""
" Hotkeys
""""""""""""""""""""""""""""""
" Switch between tabs
nnoremap <C-h> gT
nnoremap <C-l> gt

" Move tabs
nnoremap <S-h> :tabmove -1<CR>
nnoremap <S-l> :tabmove +1<CR>

" Copy all
noremap <F3> :%y+<CR>

" Run a.exe
noremap <F6> :!clear && echo Running && ./a.out<CR>

" Compile and run C++ (Windows)
noremap <F5> :!clear && echo Compiling... && g++ -std=c++11 -Wall -O2 % && echo Running && ./a.out<CR>
