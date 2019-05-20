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

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
" }

" Vim UI {

	colorscheme zenburn
	set cursorline                  " Highlight current line
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
