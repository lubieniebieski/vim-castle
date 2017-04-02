set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" plugin manager
Bundle 'gmarik/vundle'
" jump to file
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'gabrielelana/vim-markdown'
" directory viewer
Bundle 'scrooloose/nerdtree'
" comments
Bundle 'vim-scripts/tComment'
" check code
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'airblade/vim-gitgutter'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'groenewege/vim-less'
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
" undo tree
Bundle 'Townk/vim-autoclose'
Bundle 'godlygeek/tabular'
Bundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
nmap <silent> <leader>da <Plug>DashSearch
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'dracula/vim'

filetype plugin indent on
let mapleader = " "

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
hi def link CtrlPMatch CursorLine
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_switch_buffer = 'Et'
nnoremap <C-b> :CtrlPBuffer<cr>
" CtrlP Funky
let g:ctrlp_extensions = ['tag', 'funky']
let g:ctrlp_funky_multi_buffers = 1

" Color scheme
" colorscheme Tomorrow-Night-Eighties
colorscheme dracula
syntax on
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

set pastetoggle=<F2>

map <Leader>d :NERDTreeToggle<CR>
map <Leader>g :Gstatus<CR>
nmap <Leader>' cs"'
nmap <Leader>} cs} }
nmap <Leader>B :CtrlPBufTagAll<CR>
nmap <Leader>F :NERDTreeFind<CR>
nmap <Leader>hs :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

"Gundo toggle
noremap <F5> :GundoToggle<CR>

let g:ctrlp_custom_ignore = '.git$\|tmp/\|public/\|.sw[ompn]$\|.DS_STORE$\|bin/\|tags$'
let g:airline_powerline_fonts = 1

" autoremove trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

autocmd BufRead,BufNewFile *.hamlc set filetype=haml

nnoremap Q :q<CR>
map <Leader>e :e! ~/.vimrc<CR>

" Backup dirs
set undodir=~/.vim/tmp/.undo//
set backupdir=~/.vim/tmp/.backup//
set directory=~/.vim/tmp/.swp//

set backup
set swapfile
set undofile
"
" Persist undo
set undofile
" maximum number of changes that can be undone
set undolevels=9999
" maximum number lines to save for undo on a buffer reload
set undoreload=9999

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"

set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set shortmess=atI
set hlsearch                    " highlight the search
set ls=2                        " show a status line even if there's only one window
set autoread
