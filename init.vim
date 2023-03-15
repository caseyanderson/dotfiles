" .vimrc for Casey Anderson

" set the swapfile and undo directory
set backupdir=~/AppData/Local/nvim/.vimswap//
set undodir=~/AppData/Local/nvim/.vimundo//
set directory=~/AppData/Local/nvim/.vimswap//

set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine

" set guifont=Ubuntu\ Mono\ Nerd\ Font\ Complete\ 10

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'       " not working?

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'nikvdp/neomux'

Plug 'davidgranstrom/scnvim'

call plug#end()


set background=dark         " Assume a dark background
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set ttimeout
set ttimeoutlen=100

scriptencoding utf-8

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set nospell                         " Spell checking on
set hidden                          " Allow buffer switching without saving

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

set backup                  " Backups are nice ...

set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload


" Vim UI {

colorscheme zenburn

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line
set ruler                       " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                     " Show partial commands in status line

" Show the airline status bar on load
" Broken down into easily includeable segments
set statusline=%<%f\            " Filename
set statusline+=%w%h%m%r        " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]   " Filetype
set statusline+=\ [%{getcwd()}] " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set relativenumber
set showmatch                   " Show matching brackets/parentheses
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case insensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }


" Formatting {

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=4                " Use indents of 4 spaces
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>

" automatically remove trailing whitespace when :w
autocmd BufWritePre * %s/\s\+$//e

" }


" Key (re)Mappings {

" Remap space to command mode
map <space> :

"NerdTree toggle
map <C-n> :NERDTreeToggle<CR>

" Easier motion for switching between splits (Ctrl-motion)
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W> _

let mapleader = ','

" Clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>

" }


" airline {

set laststatus=2
let g:airline_powerline_fonts = 1

let g:airline_theme = 'zenburn'

if !exists('g:airline_powerline_fonts')
        " Use the default set of separators with a few customizations
        let g:airline_left_sep='›'  " Slightly fancier than '>'
        let g:airline_right_sep='‹' " Slightly fancier than '<'
endif


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


        " unicode symbols
        let g:airline_left_sep = '»'
"       let g:airline_left_sep = '▶'
        let g:airline_right_sep = '«'
"       let g:airline_right_sep = '◀'
"       let g:airline_symbols.linenr = '␊'
"       let g:airline_symbols.linenr = '␤'
        let g:airline_symbols.linenr = '¶'
"       let g:airline_symbols.branch = '⎇'
        let g:airline_symbols.paste = 'ρ'
        let g:airline_symbols.paste = 'Þ'
"       let g:airline_symbols.paste = '∥'
        let g:airline_symbols.whitespace = 'Ξ'
" }


" NERDTree {

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" }


" SCNvim {

" autocmd FileType supercollider :SCNvimStart<CR>

lua << EOF
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr
scnvim.setup {
    sclang = {
        cmd = 'C:/Program Files/SuperCollider-3.13.0/sclang.exe'
        },
    keymaps = {
        ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
        ['<C-e>'] = {
            map('editor.send_block', {'i', 'n'}),
            map('editor.send_selection', 'x'),
        },
        ['<CR>'] = map('postwin.toggle'),
        ['<M-CR>'] = map('postwin.toggle', 'i'),
        ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
        ['<C-k>'] = map('signature.show', {'n', 'i'}),
        ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
        ['<leader>st'] = map('sclang.start'),
        ['<leader>sk'] = map('sclang.recompile'),
        ['<F1>'] = map_expr('s.boot'),
        ['<F2>'] = map_expr('s.meter'),
        },
    editor = {
        highlight = {
            color = 'IncSearch',
        },
    },
    postwin = {
        float = {
            enabled = true,
        },
    },
}
EOF

" }
