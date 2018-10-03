# My dotfiles

install stow and start use it..

https://alexpearce.me/2016/02/managing-dotfiles-with-stow/

## NeoVim

- install pyenv and setup for neovim

```
# install pyenv
brew install pyenv pyenv-virtualenv pyenv-virtualenvwrapper
eval "$(pyenv -)"

# install python versions
pyenv install 3.6-dev
pyenv install 2.7

# install neovim bindings
pyenv virtualenv 3.6-dev neovim3
pyenv activate neovim3
pip install neovim
pyenv deactivate

pyenv virtualenv 2.7 neovim2
pyenv activate neovim2
pip install neovim
pyenv deactivate
```
- install vim-plug

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- initialize it:

```
:PlugInstall
```
