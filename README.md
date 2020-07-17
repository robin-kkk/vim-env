``` text
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'					  " for auto completion
Plugin 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'} " :CocInstall coc-json coc-tsserver, coc-ccls, :CocCommand clangd.install
Plugin 'crusoexia/vim-dream'                  " Theme
Plugin 'tpope/vim-fugitive'                   " vim에서 git 명령어 실행, Usage :Git commit, :Git rebase -i, :Git log, :Git diff
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'mhinz/vim-signify'                    " 버전 관리 파일 상태 표시, 파일 수정 상태 보기
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}    " for atom editor, html tag
Plugin 'scrooloose/nerdtree'                  " for directory
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'editorconfig/editorconfig-vim'        " for editor-config
Plugin 'itchyny/lightline.vim'                " for status bar
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'                             " for lint
Plugin 'https://github.com/nvie/vim-flake8'   " for python (pep8)
Plugin 'davidhalter/jedi-vim'                 " for python
Plugin 'Yggdroot/indentLine'                  " for vertical line of indentation
Plugin 'rking/ag.vim'                         " Search keyword, Usage :Ag [options] {pattern} [{directory}]
Plugin 'plasticboy/vim-markdown'              " for markdown format
Plugin 'elzr/vim-json'                        " for json
Plugin 'chrisbra/csv.vim'                     " for csv
Plugin 'godlygeek/tabular'                    " 특정 문자로 라인 정렬, Usage: Tab \<character>
Plugin 'majutsushi/tagbar'                    " 코드 함수 블록, 태그끼리 묶어서 표시 (코드 분석 용이)
Plugin 'vim-syntastic/syntastic'              " 문법 체크
Plugin 'diepm/vim-rest-console'               " 버퍼에서 REST API 호출 결과 확인, Usage: set ft=rest
Plugin 'wincent/ferret'                       " 여러 파일에서 문자열 검색,  Usage: Ack {pattern} {options}
Plugin 'schickling/vim-bufonly'               " 현재 버퍼만 남기고 모든 버퍼 삭제, Usage :Bonly, :BOnly, :Bufonly
```
