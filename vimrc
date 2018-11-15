"" BASIC SETTINGS

filetype plugin indent on

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set bomb
set binary
set ttyfast

"" Indentation
set backspace=indent,eol,start
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

"" Paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

"" Searching
set hlsearch
set incsearch
set smartcase
set ignorecase

"" Splits
set splitbelow
set splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Swap/Backup
set nobackup
set noswapfile

"" Misc
set shell=/bin/zsh
set noshowmode
set showcmd

"" VISUAL SETTINGS

syntax enable
set ruler
set number
set wildmenu
set cursorline
set lazyredraw
set relativenumber

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

"" PLUGINS

colorscheme solarized
set background=dark
let g:solarized_termtrans=1
let g:vue_disable_pre_processors=1

set laststatus=2
set statusline=\ %F%=Line:\ %4l/%4L\ \ Col:\ %3c
