# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Key binding
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Type commands as like below:
#   cd ~/.oh-my-zsh/plugins
#   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#   echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
#   git clone https://github.com/zsh-users/zsh-autosuggestions.git
#   echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up C++ for coc.nvim
export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH
export CPLUS_INCLUDE_PATH=/usr/local/Cellar/llvm/11.0.0/include/c++/v1:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include
export PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include:$PATH

# Set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Set up docker commands
alias dp='docker ps -a'
alias di='docker images'
alias dr='docker rm'
alias ds='docker start'
alias dst='docker stop'
alias dl='docker logs -f'
alias drs='docker restart'

# Set up git commands
alias gs="git status"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gl="git log"
alias gck="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gm="git merge"
alias gr="git rebase"
alias gb="git branch"

# Set up local commands
replaceAll() {
    oldKeyword=$1
    newKeyword=$2
    rootDir=$3

    if [ -z $oldKeyword ] || [ -z $newKeyword ]; then
        echo "Usage: replaceAll [old-keyword] [new-keyword] [root-dir]"
        return
    fi

    if [ -z $rootDir ]; then
        rootDir="."
    fi

    fileList=$(git grep -l "$oldKeyword" $rootDir)
    while read -r filePath
    do
        cmd="s/$oldKeyword/$newKeyword/g"
        sed -i .bak -e "$cmd" $filePath
        echo "Replaced all keywords at $filePath"
    done <<< "$fileList"

    rm -rf */**/*.bak;
}

alias re="replaceAll"
alias vi="nvim"
alias vim="nvim"

# Set up fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --inline-info'
plugins=(fzf)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set up go
export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin:$HOME/bin

# Kubernetes
export KUBECONFIG=$HOME/.kube/kubeconfig.yaml:$HOME/.kube/kubeconfig-real.yaml
alias k=kubectl
alias dev="k config use-context dev"
alias qa="k config use-context qa"
alias stage="k config use-context stage"
alias real="k config use-context real"

export TERM=xterm-256color
export EDITOR=vim
export K9S_EDITOR=vim

# shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
