set shell=/bin/sh

set hlsearch
set nu
set autoindent
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1
set autowrite
set autoread 
set cindent
set bs=eol,start,indent
set history=256
set laststatus=2
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set encoding=utf-8
set paste

au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

if has("syntax")
 syntax on
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'crusoexia/vim-dream'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

map <C-d> :NERDTreeToggle<CR>
map <C-w> <C-w><C-w>

let g:ycm_use_clangd = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
colorscheme dream

" Syntax
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_debug=3
