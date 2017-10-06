" .vimrc for Casey Anderson

set shell=/bin/bash
set background=dark			" Assume a dark background
filetype plugin indent on	" Automatically detect file types.
syntax on									" Syntax highlighting

set history=1000                    " Store a ton of history (default is 20)
set nospell                           " Spell checking on

set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
set term=xterm-256color

" Vim UI {

	colors zenburn				  " Zenburn from https://github.com/jnurmine/Zenburn
	set showmode				" Display the current mode
	set cursorline                  " Highlight current line
	set number						" show line numbers
	set wildmenu				  " visual autocomplete for command menu

" }


" Formatting {

	set autoindent					" Indent at the same level of the previous line
	set tabstop=4					" number of visual spaces per TAB
	set softtabstop=4			" number of spaces in tab when editing
	set expandtab					" tabs are spaces

" }
