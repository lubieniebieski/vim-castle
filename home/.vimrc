set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugin manager
Bundle 'gmarik/vundle'
" jump to file
Bundle 'kien/ctrlp.vim'
" directory viewer
Bundle 'scrooloose/nerdtree'
" comments
Bundle 'scrooloose/nerdcommenter'
" check code
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'bling/vim-airline'
" searching
Bundle 'mileszs/ack.vim'
" toggling line numbers (relative/absolute)
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
" snipmate dependency
Bundle 'MarcWeber/vim-addon-mw-utils'
" snipmate dependency
Bundle 'tomtom/tlib_vim'
" textmate-like snippets
Bundle 'garbas/vim-snipmate'
" default snippets for snipmate
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
set background=dark
" undo tree
Bundle 'sjl/gundo.vim'

set encoding=utf-8

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
set smartindent

set number
set wrap
set linebreak
set ruler
set nolazyredraw
set noerrorbells
set novisualbell

set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase

set magic
set pastetoggle=<F2>

set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set swapfile
set laststatus=2
set grepprg=ack
" keep the changes to the buffer without writing them to the file
set hidden

" NERDTree always opens in the current folder.
let NERDTreeChDirMode=2

cnorea w!! w !sudo tee % > /dev/null

map <Leader>d :NERDTreeToggle<CR>
map <Leader>g :Gstatus<CR>
" quick access to recently open files
nmap ; :CtrlPBuffer<CR>

"Gundo toggle
noremap <F5> :GundoToggle<CR>

let g:ctrlp_custom_ignore = '.git$\|tmp/\|public/\|.sw[ompn]$\|.DS_STORE$\|bin/\|tags$'
let g:syntastic_ruby_checkers=['rubocop']
let g:airline_powerline_fonts = 1

" autoremove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

syntax on
" solarized options
let g:solarized_termtrans = 1
colorscheme solarized

for mapmode in ["n", "x", "o"]
    exe mapmode . "noremap <expr> <Leader>0 LineNumbers()"
endfor

function! LineNumbers()
  if exists('+relativenumber')
    exe "setlocal" &l:rnu ? "nu" :  "rnu"
  else
    setl nu!
  endif
endfunction

nnoremap Q :q<CR>
map <Leader>e :e! ~/.vimrc<CR>
autocmd! bufwritepost .vimrc source ~/.vimrc
