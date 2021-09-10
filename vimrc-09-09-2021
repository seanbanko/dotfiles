" Plugins

call plug#begin('~/.vim/plugged') " Specify a directory for plugins
    Plug 'shaunsingh/nord.nvim'
    Plug 'junegunn/goyo.vim'
    Plug 'reedes/vim-pencil'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/cmp-buffer'
call plug#end() " Initialize plugin system

" General settings

nnoremap <SPACE> <Nop>
let mapleader = " "

filetype plugin on

set autoread " Automatically reload files that have changed
set backspace=indent,eol,start " Backspace over line breaks
set confirm " Ask to save on quit
set clipboard+=unnamedplus " Use system clipboard instead of vim clipboard by default
set display+=lastline " Display as much of the last line as possible
set encoding=utf-8 " Use UTF-8 encoding
set hidden " Allow hiding unsaved buffers
set laststatus=2 " Always show the status bar
set nocompatible " Don't try to be compatible with vi
set number relativenumber " Show hybrid relative line numbers
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
nnoremap n nzzzv " Keep the cursor in the center of the screen for next
nnoremap N Nzzzv " Keep the cursor in the center of the screen for next
nnoremap J mzJ`z " Keep the cursor in place when joining lines

" Change all occurences of word

nnoremap cn *``cgn 
nnoremap cN *``cgN 


" Themes

colorscheme nord

" Git commit message configuration

autocmd FileType gitcommit set textwidth=72 " Set textwidth to 72 characters for a Git commit
autocmd FileType gitcommit set colorcolumn=+1 " Color the column after the textwidth limit
autocmd FileType gitcommit set colorcolumn+=51 " Also color the 51st column for Git commit titles

" Vim-Pencil configuration

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Telescope Configuration
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" LSP Configuration

lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" nvim/cmp Configuration

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
EOF

