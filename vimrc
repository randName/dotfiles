" System {{{
set shell=/usr/bin/zsh

set path+=**
set autoread
set nobackup
set directory=~/.local/vim,/var/tmp,/tmp

set ttyfast
set lazyredraw

set mouse=a
set ttymouse=sgr
" }}}
" UI {{{
set wildmenu
set cursorline

set ruler
set number
set relativenumber

set showcmd
set noshowmode

set laststatus=2
set statusline=\ %F%=Line:\ %4l/%4L\ \ Col:\ %3c
" }}}
" Syntax & Colouring {{{
syntax enable
filetype plugin indent on

set showmatch
set matchtime=2

set t_Co=256
set background=dark
colorscheme solarized
" }}}
" Search {{{
set hlsearch
set incsearch
set smartcase
set ignorecase
" }}}
" Folding {{{
nnoremap <space> za

set foldenable
set foldcolumn=1
set foldmethod=indent
set foldlevelstart=10
" }}}
" Indentation {{{
set expandtab
set tabstop=4
set shiftwidth=4

set smarttab
set autoindent
set smartindent

set backspace=indent,eol,start
" }}}
" Encoding {{{
set binary
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=euc-jp,utf-8

set fileformats=unix,dos,mac
" }}}
" Splits {{{
set splitbelow
set splitright

nnoremap a<left>  <C-w>h
nnoremap a<down>  <C-w>j
nnoremap a<up>    <C-w>k
nnoremap a<right> <C-w>l
" }}}
" Mappings {{{
nnoremap j gj
nnoremap k gk
" }}}
" Leader Shortcuts {{{
let mapleader=","

nnoremap <leader><space> :noh<CR>
nnoremap <leader>p :set invpaste paste?<CR>
" }}}
" netrw {{{
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_dirhistmax=0

let g:netrw_alto=1
let g:netrw_altv=1
let g:netrw_winsize=20
let g:netrw_browse_split=2
" }}}
" modeline {{{
set modeline
set modelines=2
" vim: foldmethod=marker:foldlevel=0
" }}}
