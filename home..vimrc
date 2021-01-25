syntax on
:imap jj <Esc>

" To prevent scrolling being sent to the terminal, not the vim buffer in tmux
set mouse=a

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

syntax on
set rtp+=/usr/local/opt/fzf

" ESC Remapping
imap jj <Esc>
imap JJ <Esc>
:set hls is

" No compatibility mode
:set nocp
nnoremap Y y$

set relativenumber


set virtualedit=onemore


" Set directory where backup files (*.*~) and swap files (*.*.swp) are stored
set backupdir=~/vimtmp//,.
set directory=~/vimtmp//,.
set mouse=a

:set guioptions+=a

set clipboard=unnamed

" Plugins (plug is compatible with vundle)

call plug#begin('~/.vim/plugged')
" Material Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'
" Language features
Plug 'sheerun/vim-polyglot'
" Vim autocompletion (tab auto-selects)
Plug 'valloric/youcompleteme'
" Display indents
Plug 'yggdroot/indentline'
" Surround words/text with a certain character
Plug 'tpope/vim-surround'
" File explorer (Focus with ctrl + n)
Plug 'scrooloose/nerdtree'
" Status bar
Plug 'vim-airline/vim-airline'
" Status bar themes
Plug 'vim-airline/vim-airline-themes'
" Show trailing whitespace. Fix with :FixWhitespace
Plug 'bronson/vim-trailing-whitespace'
" Markdown preview"
Plug 'suan/vim-instant-markdown'
" Fzf Utilities
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Rename tabs
Plug 'gcmt/taboo.vim'
" Managing tag file - requires ctags install for indexing files
Plug 'ludovicchabant/vim-gutentags'
" Auto opening and closing of tags
Plug 'jiangmiao/auto-pairs'
" Comment with gc
Plug 'tpope/vim-commentary'
" Automatic linting
Plug 'w0rp/ale'
call plug#end()

" Material Dark Syntax highlighting
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker-community'

colorscheme material

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set t_Co=256
let g:airline_theme='material'


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" Vim command autocompletion
set wildmenu
set wildmode=longest,list,full

" Highlight screen line in insert mode
:autocmd InsertEnter,InsertLeave * set cul!

" Vim markdown preview
filetype plugin on

" Show when tags are being generated
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]
let g:gutentags_ctags_tagfile=".git/tags"

" Very magic searches
:nnoremap / /\v
:cnoremap %s/ %s/\v

" Ignore caase in search, unless you type any capital letters, then it
" automatically switches to cae sensitive (can see current value with :set
" ignorecase? for any setting)
set incsearch
set ignorecase
set smartcase

" Column width indicator
set colorcolumn=80

" ALE fixers
let g:ale_fixers = {'python': ['autopep8'], 'javascript': ['eslint'],}

