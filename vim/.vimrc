""""""""""""""""""""""""""""""
" Vundle init
""""""""""""""""""""""""""""""
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Install vundle if not already installed
if has("user_commands")
  " Setting up Vundle - the vim plugin bundler
  let VundleInstalled=0
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    let VundleInstalled=1
  endif
endif
" Required
filetype off
set nocompatible

" Runtime path and initialize
execute pathogen#infect()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""
" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" surround.vim
Plugin 'tpope/vim-surround'

" vimtex
Plugin 'lervag/vimtex'

" Breezy theme
Plugin 'fneu/breezy'
let python_hightlight_all=1

" vim-airline
Plugin 'vim-airline/vim-airline'
let g:airline_theme='breezy'

" Asynchronous Lint Engine
Plugin 'dense-analysis/ale'
let g:ale_set_highlights=0

" Vimpyter
Plugin 'szymonmaszke/vimpyter'

" All plugins must be added before
" the following line
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Solarized theme
set background=light
set termguicolors
colorscheme breezy

set ruler

let NERDTreeShowHidden=1

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
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>10 10gt

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree Toggle
nnoremap <C-o> :NERDTreeToggle<Cr>
