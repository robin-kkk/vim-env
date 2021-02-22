#!/bin/sh

cd ~/Downloads

# Install home brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Change the ownership
sudo chown -R $(whoami) /usr/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig

# Install utility
brew install zsh zsh-syntax-highlighting wget curl git tig vim tmux node yarn tree llvm python3
# brew install eddieantonio/eddieantonio/imgcat

# Set up terminal
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Unzip and add it to Font Book(mac app, 서체 관리자), and then iTerm -> Preferences -> Profiles -> Texts -> Literatur
git clone https://github.com/naver/d2codingfont.git

# iTerm -> Preferences -> Profiles -> Colors -> import "iTerm2-Color-Schemes/themes/argonaut" -> select Argonaut, Background: Black
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git

# Init .zshrc
git clone https://github.com/ke2ek/my_env.git
cp my_env/zsh/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp my_env/zsh/.zshrc ~/.zshrc
source ~/.zshrc

# Set up vim
cp -r my_env/vim/.vim/* ~/.vim/
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vi -c "PluginInstall" -c q
# C++ settings
echo 'export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH' >> ~/.zshrc
echo 'export CPLUS_INCLUDE_PATH=/usr/local/Cellar/llvm/11.0.0/include/c++/v1:/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include' >> ~/.zshrc
brew install ctags-exuberant

# Set up python
pip3 install --upgrade pip
pip3 install flake8 pylint yapf
brew install zlib pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
brew install pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
source ~/.zshrc

# Usage:
#   pyenv install/uninstall <version>
#   pyenv virtualenv <version> <venv-name>
#   pyenv activate <venv-name>
#   source deactivate

# CLI Tools for MAC OS
echo 'export PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include:$PATH' >> ~/.zshrc

