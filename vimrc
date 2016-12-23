"" BASIC SETTINGS

filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Indentation
set backspace=indent,eol,start
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"" Misc
set shell=/bin/zsh
set fileformats=unix,dos,mac
set wildmenu
set showcmd
set lazyredraw

"" VISUAL SETTINGS

syntax enable
set ruler
set number
set cursorline

"" Folding
nnoremap <space> za
set foldenable
set foldcolumn=1
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

"" Matching brackets
set showmatch
set mat=2

if $TERM == 'xterm'
    set term=xterm-256color
    set t_Co=256
endif

colorscheme solarized
set background=dark
let g:solarized_termtrans=1

set laststatus=2
set statusline=\ %F%=Line:\ %4l/%4L\ \ Col:\ %3c
