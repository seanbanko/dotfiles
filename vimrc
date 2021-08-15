" Plugins

call plug#begin('~/.vim/plugged') " Specify a directory for plugins

Plug 'arcticicestudio/nord-vim'

call plug#end() " Initialize plugin system

" General settings
"
set autoread " Automatically reload files that have changed
set backspace=indent,eol,start " Backspace over line breaks
set confirm " Ask to save on quit
set clipboard+=unnamedplus " Use system clipboard instead of vim clipboard by default
set display+=lastline " Display as much of the last line as possible
set encoding=utf-8 " Use UTF-8 encoding
set hidden " Allow hiding unsaved buffers
set laststatus=2 " Always show the status bar
set nocompatible " Don't try to be compatible with vi
set number " Show line numbers
set ruler " Show ruler
set scrolloff=1 " Always display at least one line above/below the cursor
set showmatch " Show matching parenthesis
set title
set visualbell " Flash on errors instead of beeping
set t_vb= " Disable visual bell flash
set wildmenu

" Tabs and indenting

set autoindent " Match indentation level from previous line
set expandtab " Use spaces instead of tabs
set shiftwidth=4 " Number of characters used for auto-indenting
set smartindent " ???
set smarttab " ???
set softtabstop=4 " Number of characters a tab inserts in insert mode
set tabstop=4 " Number of characters a tab counts for

" Search

set gdefault " Use global flag by default
set hlsearch " Highlight matches
set ignorecase " Case-insensitive search by default
set incsearch " Live preview search matches
set smartcase " Case sensitive search if it contains an uppercase letter

" Remaps

map Y y$ " Make y behave like d and c
vnoremap J :m'>+1<CR>gv=gv " Move selected text down in visual mode
vnoremap K :m'>-2<CR>gv=gv " Move selected text up in visual mode
nnoremap n nzzzv " Keep the cursor in the center of the screen for next
nnoremap N Nzzzv " Keep the cursor in the center of the screen for next
nnoremap J mzJ`z " Keep the cursor in place when joining lines

" Change all occurences of word

nnoremap cn *``cgn 
nnoremap cN *``cgN 

" Themes

colorscheme nord

