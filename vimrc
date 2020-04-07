" System {{{
set shell=$SHELL

set runtimepath+=~/.dotfiles/vim
set packpath+=~/.dotfiles/vim

set path+=**

set hidden
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

set tabstop=2
set shiftwidth=2
set softtabstop=2

set smarttab
set expandtab
set autoindent

set showbreak=↪
set backspace=indent,eol,start
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:+,eol:¶
" }}}
" Syntax & Colours {{{
filetype plugin indent on
syntax enable

set showmatch
set matchtime=2
set matchpairs+=<:>

set foldenable
set foldcolumn=1
set foldmethod=indent
set foldlevelstart=10

set t_Co=256
set background=dark
colorscheme solarized
" }}}
" UI {{{
set splitbelow
set splitright

set wildmenu
set completeopt=menuone,longest

set cursorline

set scrolloff=1
set sidescrolloff=5

set ruler
set number
set relativenumber

set showcmd
set noshowmode
set display+=lastline

set laststatus=2
set statusline=\ %F%m%r%h%w%=(%{&ff}/%Y)\ L\ %l/%L,\ C\ %3c\ %3p%%
" }}}
" Search {{{
set hlsearch
set incsearch
set smartcase
set ignorecase
" }}}
" Mappings {{{
let mapleader=','

" fold
nnoremap <space> za

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" display search results in middle
nnoremap n nzz
nnoremap N Nzz

" traverse display lines by default
nnoremap j gj
nnoremap k gk

" clear search highlight
nnoremap <leader>l :nohlsearch<CR>

" send yanked stuff to clipboard with OSC52
nnoremap <C-c> :exec "!printf ".shellescape(system('osc52', @0))<CR><CR>

" toggles
nnoremap <leader>w :set invlist list?<CR>
nnoremap <leader>p :set invpaste paste?<CR>

" remove whitespace
nnoremap <leader>t :%s/\s\+$//<CR>
nnoremap <leader>d :%s/<C-v><C-m>//<CR>

" prevent complaints when quitting
nnoremap ZZ <nop>
nnoremap ZQ <nop>

cnoreabbrev Q! q!
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev X x
" }}}
" Misc {{{
" disable default plugins
let g:loaded_logiPat = 1
let g:loaded_rrhelper = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
" }}}
" modeline {{{
set modeline
set modelines=2
" vim: foldmethod=marker:foldlevel=0
" }}}
