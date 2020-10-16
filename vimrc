" Vim Run Command File
"
" File: ~/.vimrc
" Author: Yecheng Fu <cofyc.jackson@gmail.com>

set nocompatible
set backspace=indent,eol,start

" File Format
set fileformats=unix,dos,mac " file formats to try when opening file

" File Encoding
set encoding=utf-8  " internal encoding
set fileencodings=utf-8,gb18030 " file encodings to try when opening file

" History Line
set history=1000

" Filetype
filetype on
filetype plugin on
filetype indent on

" Set mapleader
let mapleader = ","

" Syntax Highlight
syntax on

" Color
colorscheme zellner

set autoread
set so=7
set wildmenu
set ruler
set cmdheight=1
set nu
set lz
set hid
set incsearch
set magic
set noerrorbells
set novisualbell
set showmatch
set mat=2
set hlsearch
set laststatus=2
set statusline=%F%m%r%h%w%y[%{&fileencoding}][%{&ff}]\ \ Line:\ %l/%L\ \ Col:\ %c\ \ Cwd:\ %{getcwd()}
set nobackup
set nowb
set noswapfile
set nofen
set fdl=0

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Indent
set autoindent
set smartindent
set cindent
set cino=:0
