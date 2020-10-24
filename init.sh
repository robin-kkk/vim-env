#!/bin/sh

cd ~/Downloads

# Install home brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Change the ownership
sudo chown -R $(whoami) /usr/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig


# Install utility
brew install zsh zsh-syntax-highlighting wget curl git tig vim tmux node yarn


# Set up terminal
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add it to font book and iTerm -> Preferences -> Profiles -> Texts -> Literatur
git clone https://github.com/naver/d2codingfont.git

# iTerm -> Preferences -> Profiles -> Colors -> Argonaut, Background: Black
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git

# Make-up
git clone https://github.com/ke2ek/my_env.git
cp my_env/zsh/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp my_env/zsh/.zshrc ~/.zshrc
source ~/.zshrc


# Set up vim
cp my_env/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
cp -r my_env/vim/.vim/autoload ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Enter here
vi -c "PluginInstall" -c q -c "call coc#util#install()" -c q! -c q!
vi -c "CocInstall coc-json coc-tsserver coc-ccls" -c q -c q
cd ~/.config/coc/extensions/node_modules/coc-ccls
ln -s node_modules/ws/lib lib


# Set up python
sudo pip3 install --upgrade pip
brew install zlib pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
brew install pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
source ~/.zshrc

# pyenv install/uninstall <version>
# pyenv virtualenv <version> <venv-name>
# pyenv activate <venv-name>
# deactivate
