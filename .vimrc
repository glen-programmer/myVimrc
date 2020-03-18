
" Git version control is active
" basics

set nocompatible
filetype plugin on
filetype indent on
syntax on
set t_Co=256
set encoding=utf-8
set number relativenumber
set cursorline
set showcmd
" disable auto-comment
set formatoptions-=cro


" Set splits option
set splitright 

" Set matching parenthesis
set showmatch


" Searching

set ignorecase
set smartcase
set hlsearch

" Indentation options

set autoindent
set smartindent
filetype indent on
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

inoremap JK <esc>
inoremap jk <esc>
vnoremap JK <esc>
vnoremap jk <esc>

" map leader and its key combinations
let mapleader = " "
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :wq<cr>
nnoremap <leader>l :q!<cr>
nnoremap <leader>, :vsplit<cr>
nnoremap <leader>u :source $MYVIMRC<cr>
nnoremap <leader>s :Files<cr>

" use <leader>[] to jump between tabs
nnoremap y gt

" Use NERDTree with <leader>n
nnoremap <leader>n :NERDTreeToggle<CR>

" <leader>p was used by prettier already

" PlugIn related

" Open NERDTree on startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" COC Keybindings
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)
" gr - find references
nmap <silent> gr <Plug>(coc-references)
" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" rename the current word in the cursor
nmap <leader>cr  <Plug>(coc-rename)
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)

" For C++

set cindent
" Compilation
nnoremap <F5> :w!<cr>:!g++ -g -std=c++11 %<cr>


" Disabled stuff
" noremap is non-recursive so don't worry
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" Finding Files
set wildmode=longest,list,full
set path+=**
set wildmenu

" vim-plug section

call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'

call plug#end()


" Put these lines at the very end of your vimrc file.
" Required by ALE

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
