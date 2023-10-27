# Usage

## Install Neovim 0.9.x

https://github.com/neovim/neovim/wiki/Building-Neovim

## Install node (>=17), yarn

### MacOS

``` bash
brew install neovim node
brew install yarn --ignore-dependencies
brew update
brew upgrade node yarn
```

### Linux

```bash
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -- 
sudo apt-get install nodejs
sudo npm install -g yarn
```

## 
```bash
git clone https://github.com/r4v3n-k/vim-env
mv vim-env/nvim ~/.config

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vi -c "PlugInstall"

# build coc.nvim if got error
cd ~/.config/nvim/plugged/coc.nvim
yarn install
yarn build
```
