set nocompatible    " Be improved.
filetype off        " Required for vundle.
set rtp+=~/.vim/bundle/Vundle.vim   " Set the runtime path to include Vundle and initialize.
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'crusoexia/vim-dream'            " Theme
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'          " A light and configurable statusline/tabline plugin.
Plugin 'vim-airline/vim-airline'        " Lean & mean status/tabline
" Status bar that displays things like the current virtualenv, git branch, files being edited, and much more.
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'mhinz/vim-signify'              " Show vertical status bar for version contorl.
Plugin 'scrooloose/nerdtree'            " Show directory structures.
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tmhedberg/SimpylFold'           " Folding
Plugin 'Yggdroot/indentLine'            " Show vertical line of indentation.
Plugin 'majutsushi/tagbar'              " Provide an easy way to browse the tags.
" Usage: Tab \<character>
Plugin 'godlygeek/tabular'              " Align lines with the given character.
Plugin 'git://git.wincent.com/command-t.git'    " Running commands, or previous searches and commands
Plugin 'rking/ag.vim'                   " Search keyword, :Ag [options] {pattern} [{directory}]
Plugin 'chrisbra/csv.vim'               " CSV formatter
Plugin 'plasticboy/vim-markdown'        " Markdown formatter, :Toc, :InsertNToc, :InsertToc
" Syntax/Linting/auto-completion
Plugin 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plugin 'tpope/vim-fugitive'             " Git command
Plugin 'fatih/vim-go'                   " Vim for go
call vundle#end()
filetype plugin indent on
filetype plugin on
syntax enable
syntax on

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
nmap <space> za
set ruler               " Mark the current cursor.
set cursorline
" Put cursor at the last modified location.
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" Encoding with korean
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif

" Settings for plugins
let g:airline_left_sep=''
let g:airline_right_sep=''

" :tabfind <Tab key>, :tabs
" colorscheme dream
colorscheme gruvbox

" itchyny/lightline.vim, vim-airline/vim-airline
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" scrooloose/nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview=1


" Yggdroot/indentLine
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


" majutsushi/tagbar
inoremap     :call align()a
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


" for vim-markdown
let g:vim_markdown_folding_disabled = 1

" rking/ag.vim
" Before execute, brew install ag, ack
if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif

" neoclide/coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
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
nmap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nmap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:python3_host_prog = system('which python3')
let g:coc_global_extensions = ['coc-explorer', 'coc-ccls', 'coc-clangd', 'coc-cmake', 'coc-json', 'coc-tsserver', 'coc-import-cost', 'coc-eslint', 'coc-snippets', 'coc-html', 'coc-css', 'coc-emmet', 'coc-git', 'coc-pyright', 'coc-python', 'coc-sh', 'coc-yaml', 'coc-docker', 'coc-html', 'coc-markdownlint', 'coc-go']
let g:coc_global_extensions += ['https://github.com/andys8/vscode-jest-snippets']

" the required commands for coc.nvim
" brew install node yarn
" ~/.vim/coc-settings.json
" cd ~/.config/coc/extensions/node_modules/coc-ccls
" ln -s node_modules/ws/lib lib

" for c tag in CocList, before using it, brew install ctags-exuberant
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'"

" Shortcut
map <C-x> :TagbarToggle<CR>
map <C-d> :NERDTreeToggle<CR>
map <C-g> :tabnext<CR>
map <C-n> :tabnew<CR>
map <C-q> :tabclose<CR>
map <C-w> <C-w><C-w>

" Python Auto-formatter, before using it, pip install yapf
au FileType python nmap <C-c> :0,$!yapf<Cr>:OR<Cr>

" Go commands
au FileType go nmap <Leader>gd :GoDefTab<CR>

" tab to spaces doesn't work in vim-go thus change it
