# Usage

``` bash
brew install neovim node
brew install yarn --ignore-dependencies
brew update
brew upgrade node yarn

git clone https://github.com/r4v3n-k/vim-env
mv vim-env/nvim ~/.config

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vi -c "PlugInstall"
```
