syntax enable
let mapleader = "\<Space>"

filetype plugin on
filetype indent on

set history=500

set nocompatible
filetype off

set rtp+=$HOME/.vim_config/plugins/bundle/Vundle.vim
call vundle#begin('$HOME/.vim_config/plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-rooter'

call vundle#end()
filetype plugin indent on

" set relative line numbers
set number relativenumber
set nu rnu

" show search count (only works in vim 8.0+)
set shortmess-=S

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Searching better
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
