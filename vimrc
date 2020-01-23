" System {{{
set shell=/usr/bin/zsh

set runtimepath+=~/.dotfiles/vim
set packpath+=~/.dotfiles/vim

set path+=**
set autoread
set nobackup
set directory=~/.local/vim,/var/tmp,/tmp

set ttyfast
set lazyredraw

set ttimeout
set notimeout
set timeoutlen=500

set mouse=a
set ttymouse=sgr
" }}}
" Encoding {{{
set binary
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=euc-jp,utf-8
" }}}
" Whitespace {{{
set fileformats=unix,dos,mac

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab
set autoindent
set smartindent

set backspace=indent,eol,start
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
" Syntax & Colours {{{
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
" Splits {{{
set splitbelow
set splitright

function! TmuxResize(direction)
    let l:direction = ['h', 'j', 'k', 'l']

    let l:amount = 5
    let l:resize = 'resize '
    if a:direction == 0 || a:direction == 3
        let l:amount = 10
        let l:resize = 'vertical ' . l:resize
    endif

    let l:cw = winnr()
    exec 'wincmd ' . l:direction[a:direction]
    if winnr() == l:cw
        exec l:resize . '-' . l:amount
    else
        wincmd p
        exec l:resize . '+' . l:amount
    endif
endfunction

nnoremap a<left>  <C-w>h
nnoremap a<down>  <C-w>j
nnoremap a<up>    <C-w>k
nnoremap a<right> <C-w>l

nnoremap <silent> ar<left>  :call TmuxResize(0)<CR>
nnoremap <silent> ar<down>  :call TmuxResize(1)<CR>
nnoremap <silent> ar<up>    :call TmuxResize(2)<CR>
nnoremap <silent> ar<right> :call TmuxResize(3)<CR>
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
" plugins {{{
let g:netrw_liststyle=3
" }}}
" modeline {{{
set modeline
set modelines=2
" vim: foldmethod=marker:foldlevel=0
" }}}
