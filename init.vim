syntax enable
let mapleader = "\<Space>"

filetype plugin on
filetype indent on

set history=500

set nocompatible
filetype off

set rtp+=$HOME/.vim_config/plugins/Vundle.vim
call vundle#begin('$HOME/.vim_config/plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-rooter'
Plugin 'rhysd/vim-clang-format'
Plugin 'dense-analysis/ale'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'chriskempson/base16-vim'
Plugin 'machakann/vim-highlightedyank'

call vundle#end()
filetype plugin indent on

" line over and under the cursor
set so=10

" set relative line numbers
set number relativenumber
set nu rnu

" fixes cursor lag
set ttimeoutlen=100

" show search count (only works in vim 8.0+)
set shortmess-=S

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Searching better
set ignorecase
set smartcase
set hlsearch
set incsearch 

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" 1 tab == 4 spaces
" set shiftwidth=4
set tabstop=4

" Allow mouse clicks
set mouse=a

" Config backspace to behave normally
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CursorShape for TMUX with iTerm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if $TERM_PROGRAM =~ "iTerm"
    if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
      let &t_SR = "\<Esc>]50;CursorShape=2\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    endif
endif
