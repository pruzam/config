set nocompatible " be iMproved
filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
call vundle#end()

" ==========================================================
" Basic Settings
" ==========================================================
syntax on " syntax highlighing
filetype on " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype
set number " Display line numbers
set background=dark " We are using dark background in vim
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=full " <Tab> cycles between all matching choices.

""" Moving Around/Editing
set cursorline " have a line indicate the cursor location
set ruler " show the cursor position all the time
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL
set showmatch " Briefly jump to a paren once it's balanced
set wrap " Wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql " Setting text and comment formatting to auto
set textwidth=80 " Lines are automatically wrapped after 80 columns

""" Searching and Patterns
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex

if exists("+undofile")
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if isdirectory($HOME . '/.vim/undo') == 0
:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif
set undodir=./.vim-undo//
set undodir+=~/.vim/undo//
set undofile
endif 

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme= "solarized"

set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256

nnoremap <F5> :GundoToggle<CR>

let g:pymode_folding = 0 
let g:pymode_rope = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\u3000"

set completeopt-=preview
set wildmenu
let g:ycm_auto_trigger = 0
setlocal omnifunc=pythoncomplete
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

set wildignore+=*.pyc

set relativenumber
set number

" find merge conflict markers
nmap <silent> <Leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

let g:ycm_disable_for_files_larger_than_kb = 10000
