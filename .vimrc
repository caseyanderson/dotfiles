" .vimrc for Casey Anderson

" set the swapfile and undo directory
set backupdir=~/.vimswap//
set undodir=~/.vimundo//
set directory=~/.vimswap//

set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine

" Bundles {
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    Plugin 'flazz/vim-colorschemes'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'airblade/vim-gitgutter'
    
    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

" }

set shell=/bin/bash

set background=dark         " Assume a dark background
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set ttimeout
set ttimeoutlen=100

scriptencoding utf-8


if has('clipboard')
	if has('unnamedplus')  " When possible use + register for copy-paste
		set clipboard=unnamedplus
	else         " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

set backup                  " Backups are nice ...

set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

" Vim UI {

    colorscheme zenburn

    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
    
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

     set splitright                  " Puts new vsplit windows to the right of the current
     set splitbelow                  " Puts new split windows to the bottom of the current

" }

" Key (re)Mappings {

    "Remap space to command mode
    map <space> :

    "NerdTree toggle
    map <C-e> :NERDTreeToggle<CR>

    let mapleader = ','

    " Clear search highlight
    nmap <silent> <leader>/ :nohlsearch<CR>

" }
