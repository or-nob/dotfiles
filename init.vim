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
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'chriskempson/base16-vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'jackguo380/vim-lsp-cxx-highlight'
Plugin 'tomasiser/vim-code-dark'
Plugin 'wojciechkepka/vim-github-dark'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'ciaranm/securemodelines'

call vundle#end()
filetype plugin indent on

" Line over and under the cursor
if has("mac")
    set so=10
elseif has("linux")
    set so=5
end

" Set relative line numbers
set number relativenumber
set nu rnu

" Fixes cursor lag
set ttimeoutlen=100

" Show search count (only works in vim 8.0+)
set shortmess-=S

" Show command while typing
set showcmd

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

let base16colorspace=256

" Searching better
set ignorecase
set smartcase
set hlsearch
set incsearch 

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Allow mouse clicks
set mouse=a

" Config backspace to behave normally
set backspace=indent,eol,start

" Set internal encoding of vim
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" TextEdit might fail if hidden is not set.
set hidden

set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Add a bit extra margin to the left
set foldcolumn=1

" Sane splits
set splitright
set splitbelow

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" clipboard shortcut
noremap <leader>y "+y
noremap <leader>p "+p

" Stop paste from copying selected part into a buffer.
" vnoremap p pgvy
vnoremap p "_dP

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Toggle between two buffers
map <silent> <leader><leader> <c-^>

" Open a vertical split
map <silent> <leader>z :vsplit<cr>

" Close a vertical split
map <silent> <leader>x <C-w>q<cr>

" Settings needed for .lvimrc (Local vimrc)
set exrc
set secure

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map auto complete of (, ", ', [
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CursorShape for Gnome-Terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
