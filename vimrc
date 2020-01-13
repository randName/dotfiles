"" BASIC SETTINGS

filetype plugin indent on
syntax enable

set shell=/usr/bin/zsh

set nobackup
set noswapfile

set wildmenu

"" Display
set ttyfast
set lazyredraw
set cursorline

set ruler
set number
set relativenumber

set showmatch
set matchtime=2

set showcmd
set noshowmode

set laststatus=2
set statusline=\ %F%=Line:\ %4l/%4L\ \ Col:\ %3c

set t_Co=256
set background=dark
colorscheme solarized

"" Search
set hlsearch
set incsearch
set smartcase
set ignorecase

"" Folding
nnoremap <space> za

set foldenable
set foldcolumn=1
set foldmethod=indent
set foldlevelstart=10

""" Indentation & EOL
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

set smarttab
set autoindent
set smartindent

set noeol
set nofixeol
set fileformats=unix,dos,mac

"" Encoding
set bomb
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=euc-jp,utf-8

"" Splits
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Mappings
nnoremap <leader>p :set invpaste paste?<CR>

"" PLUGINS
