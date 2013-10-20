set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'bling/vim-airline'

filetype plugin on
syntax on

set encoding=utf-8
set showmode

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set autoindent
set numberwidth=5
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

cnorea w!! w !sudo tee % > /dev/null

map <Leader>d :NERDTreeToggle<CR>
map <Leader>g :Gstatus<CR>

let g:ctrlp_custom_ignore = '.git$\|tmp/\|public/\|.sw[ompn]$\|.DS_STORE$\|bin/\|tags$'
let g:syntastic_ruby_checkers=['rubocop mri']
let g:airline_powerline_fonts = 1

:color xoria256

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
