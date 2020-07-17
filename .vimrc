set hlsearch " 검색어 하이라이팅
set nu " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set cursorline
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
" 구문 강조 사용
if has("syntax")
 syntax on
endif

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'crusoexia/vim-dream'
Plugin 'tpope/vim-fugitive' " vim에서 git 명령어 실행, Usage :Git commit, :Git rebase -i, :Git log, :Git diff
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} " for atom editor, html tag
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale' " for lint
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim' " for python auto-completion
Plugin 'https://github.com/nvie/vim-flake8' " for python lint (pep8)
Plugin 'vim-airline/vim-airline' " for status bar
Plugin 'Yggdroot/indentLine' " 세로줄 표시
Plugin 'rking/ag.vim' " Usage: Ag <keyword>
Plugin 'mhinz/vim-signify' " 버전 관리 파일 상태 표시, 파일 수정 상태 보기
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-simplefold' " 코드 접기, Usage: Fold <string>
Plugin 'godlygeek/tabular' " 특정 문자로 라인 정렬, Usage: Tab \<character>
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json' " for json
Plugin 'chrisbra/csv.vim' " for csv
Plugin 'vim-syntastic/syntastic'
Plugin 'diepm/vim-rest-console' " 버퍼에서 REST API 호출 결과 확인, Usage: set ft=rest
Plugin 'wincent/ferret' " 여러 파일에서 문자열 검색,  Usage: Ack {pattern} {options}
Plugin 'schickling/vim-bufonly' " 현재 버퍼만 남기고 모든 버퍼 삭제, Usage :Bonly, :BOnly, :Bufonly
call vundle#end()
filetype plugin indent on

nmap <C-x> :TagbarToggle<CR>

map <C-d> :NERDTreeToggle<CR>
map <C-w> <C-w><C-w>

colorscheme dream

" Syntax
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" for syntastic
let g:syntastic_html_tidy_ignore_errors=[
    \'proprietary attribute "ng-',
    \'proprietary attribute "chart-',
    \'proprietary attribute "pdk-'
\]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_java_checkers = ['javac', 'checkstyle']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_c_checkers = ['clang_check']
let g:syntastic_html_checkers = ['jshint']
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:syntastic_error_symbol = '❌ '
let g:syntastic_warning_symbol = '✗ '
let g:syntastic_style_error_symbol = '❓'
let g:syntastic_style_warning_symbol = '❔'
let g:syntastic_java_checkstyle_classpath = '~/checkstyle-7.6-all.jar'
let g:syntastic_java_checkstyle_conf_file = '~/sun_checks.xml'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" for YouCompleteMe
let g:ycm_server_python_interpreter = '/Users/user/.pyenv/shims/python3'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['', '']
let g:SuperTabDefaultCompletionType = ''
let g:ycm_autoclose_preview_window_after_completion=1
map g :YcmCompleter GoToDefinitionElseDeclaration
let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
\             're!\[.*\]\s'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\ }


" for vim-flake8
let g:flake8_show_in_file=1   " show

" for ag.vim
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['', '', ''],
    \ }
endif

" for indentline
let g:indentLine_color_gui = '#385900'
let g:indentLine_color_term = 100
let g:indentLine_char = '¦'
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 0
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'text', 'sh']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_maxLines = 3000
nnoremap \il :IndentLinesToggle

" for vim-simplefold
let g:SimpylFold_docstring_preview=1

" tabular
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
