call plug#begin('~/.config/nvim/plugged')
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" tree
Plug 'scrooloose/nerdtree'	         " Show directory structures.
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'unkiwii/vim-nerdtree-sync'     " Sync cursor line for the current file
" autocomplete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'          " pairs quotes or braket
" status bar
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'       " Lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'         " A light and configurable statusline/tabline plugin.
" status bar that displays things like the current virtualenv, git branch, files being edited, and much more.
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'mhinz/vim-signify'             " Show vertical status bar for version contorl.
" display object/function structure
Plug 'majutsushi/tagbar'             " Provide an easy way to browse the tags.
" multi cursor
Plug 'terryma/vim-multiple-cursors'
" smooth scroll
Plug 'terryma/vim-smooth-scroll'
" search, before installing, brew install ag, ack
Plug 'rking/ag.vim'                  " Search keyword, :Ag [options] {pattern} [{directory}]
" align / folding
Plug 'tmhedberg/SimpylFold'          " Folding
Plug 'godlygeek/tabular'             " Align lines with the given character. Usage: Tab \<character>
Plug 'chrisbra/csv.vim'              " CSV formatter
Plug 'Yggdroot/indentLine'           " Show vertical line of indentation.
" theme
Plug 'morhetz/gruvbox'
" golang
Plug 'fatih/vim-go'                  " Vim for go
" git
Plug 'airblade/vim-gitgutter'        " git change status
Plug 'tpope/vim-fugitive'            " git command wrapper
" python
Plug 'jmcantrell/vim-virtualenv'
" bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
Plug 'bazelbuild/vim-ft-bzl'
" telescope, before installing, brew install ripgrep fd, and then :checkhealth telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" debugger
Plug 'puremourning/vimspector'
call plug#end()


"" VIM configuration
set encoding=utf-8
set nu                  " Show line number.
set smartcase           " Search with sensitive with capitals.
set ignorecase
set incsearch           " Incremental search
set hlsearch            " Highlight search keyword.
set cindent             " C-lang indentation
set tabstop=4           " Set up indentation.
if expand("%:e") == "go"
    set softtabstop=0
    set noexpandtab
    set shiftwidth=8
elseif expand("%:e") == "json"
    set softtabstop=2
    set shiftwidth=2
else
    set softtabstop=4
    set expandtab           " Save tab as space.
    set shiftwidth=4        " # of spaces in shift indentation (>>, <<)
endif
set autoindent
set smartindent
set laststatus=2        " Print always status bar.
set showmatch           " Highlight matched parenthesis.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace
set wildmenu            " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set backspace=indent,eol,start  " Move on indent,eol,start with backspace key.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=15         " Enable scroll 15 lines out of the current line.
set sidescrolloff=15
set sidescroll=1
set cmdheight=2
set autoread
set autowrite           " Automatically save before commands like :next and :make
set history=1000        " Remember more commands and search history
set undolevels=1000     " Use many muchos levels of undo
set novisualbell        " Don't beep
set noerrorbells
set mouse=a             " Enable mouse support.
set textwidth=119
set colorcolumn=120
set foldmethod=marker   " Enable folding with the spacebar.
if expand("%:e") == "py"
    set foldmethod=indent
endif
set foldlevel=99
set ruler               " Mark the current cursor.
set cursorline
set clipboard+=unnamed  " Allow to copy & paste
" Put cursor at the last modified location.
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" Encoding with korean
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif


""" NERDTree Configuration
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\~$']


""" ignore list
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$\|node_modules$',
\ 'file': '\v\.(exe|so|dll)$'
\ }


""" IndentLine
let g:indentLine_color_gui = '#585858'
let g:indentLine_color_term = 101
let g:indentLine_char = '┊'
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'text', 'sh']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_maxLines = 3000
nmap \il :IndentLinesToggle


""" TagBar
noremap     :call align()a
function! s:align()
let p = '^\s*|\s.*\s|\s*$'
if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
endif
endfunction


""" CoC
let g:python3_host_prog = '/Users/user/miniforge3/envs/server/bin/python'
let g:coc_global_extensions = ['coc-explorer', 'coc-ccls', 'coc-clangd', 'coc-cmake', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-html', 'coc-css', 'coc-emmet', 'coc-python', 'coc-sh', 'coc-yaml', 'coc-json', 'coc-docker', 'coc-markdownlint', 'coc-go', 'coc-pyright']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']
" coc-pyright settings: https://github.com/fannheyward/coc-pyright/blob/master/package.json

" for c tag in CocList, before using it, brew install ctags-exuberant
" cd ~/.config/coc/extensions/node_modules/coc-ccls
" ln -s node_modules/ws/lib lib
" :CocCommand cland.install
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'"


""" Airline
let g:airline#extensions#tabline#enabled = 1              " Open the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'          " Print the filenames in the list of buffers
let g:airline#extensions#tabline#buffer_nr_show = 1       " Show buffer number
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " Show buffer number format
let g:airline_theme='bubblegum'


""" SimpleFold
let g:SimpylFold_docstring_preview=1


""" Ag, Before execute,
if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif


""" Shortcut
nmap <silent><nowait> <C-d>  :<C-u>NERDTreeToggle<cr>
nmap <silent><nowait> <C-x>  :<C-u>TagbarToggle<cr>
" Tab
nmap <silent><nowait> T  :<C-u>tabnew<cr>
nmap <silent><nowait> }  :<C-u>tabnext<cr>
nmap <silent><nowait> {  :<C-u>tabprevious<cr>
nmap <silent><nowait> Q  :<C-u>tabclose<cr>
" Buffer
nmap <silent><nowait> <space>l :<C-u>ls<cr>
nmap <silent><nowait> <space>b :<C-u>enew<cr>
nmap <silent><nowait> < :<C-u>bprevious!<cr>
nmap <silent><nowait> > :<C-u>bnext!<cr>
nmap <silent><nowait> S :bp <BAR> bd #<cr>
" Splitted window
nmap <silent><nowait> <space>q :<C-u>q!<cr>
nmap <silent><nowait> <space>w :<C-u>wq<cr>
map <C-w> <C-w><C-w>
" Coc : GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Coc : Mappings for CoCList
" Show all diagnostics.
nmap <silent><nowait> <C-a>  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nmap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nmap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nmap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nmap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nmap <silent><nowait> <space>k  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent><nowait> <space>j  :<C-u>CocPrev<CR>
" Resume latest coc list.
nmap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Git Command (command :Git before typing the following)
nmap <silent><nowait> z  :<C-u>G<CR>
nmap <Leader>gl :Git log<CR>
nmap <Leader>gca :Git write<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gr :Git remove<CR>
nmap <Leader>gpl :Git pull<CR>
nmap <Leader>gdf :Git vdiff<CR>

" Telescope
nmap <silent><nowait>ff :<C-u>Telescope find_files<cr>
nmap <silent><nowait>fg :<C-u>Telescope live_grep<cr>
nmap <silent><nowait>fh :<C-u>Telescope help_tags<cr>
nmap <silent><nowait>fb :<C-u>Telescope buffers<cr>

" :ls -> list up all the buffers
" :b[n] -> move to the n-th buffer
" :bd[n] -> remove the n-th buffer if n is given, otherwise current buffer is closed
" :bp[n] -> move to the previous buffer
" :bn[n] -> move to the next buffer
" :sb[n] -> split horizontally and load the n-th buffer on a new buffer
" :bf -> move to the first buffer
" :bl -> move to the last buffer


" Theme
syntax enable
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

" Debugger (https://github.com/puremourning/vimspector#mappings)
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>b :<C-u>call vimspector#Launch()<cr>
nmap <space>1 :<C-u>call vimspector#ToggleBreakpoint()<cr>
nmap <space>2 :<C-u>call vimspector#Continue()<cr>
nmap <space>3 :<C-u>call vimspector#StepOver()<cr>
nmap <space>4 :<C-u>call vimspector#StepInto()<cr>
nmap <space>5 :<C-u>call vimspector#StepOut()<cr>
nmap <leader>p :<C-u>call vimspector#Pause()<cr>
nmap <leader>s :<C-u> call vimspector#Stop()<cr>
nmap <leader>rs :<C-u>VimspectorReset<cr>
nmap <Leader>be <C-u>VimspectorBalloonEval<cr>
nmap <leader>e :<C-u>VimspectorEval<cr>
nmap <leader>w :<C-u>VimspectorWatch<cr>
nmap <leader>o :<C-u>VimspectorShowOutput<cr>
nmap <leader>u :<C-u>call vimspector#UpFrame()<cr>
nmap <leader>d :<C-u>call vimspector#DownFrame()<cr>
