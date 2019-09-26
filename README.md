# .dotfiles
Configuration files for `zsh`, `tmux` and `vim`

Very loosely based on [The Text Triumvirate](https://www.drbunsen.org/the-text-triumvirate/)

## Installing
1) Install `zsh`, `tmux` and `vim`
```shell
sudo apt purge vim-tiny*
sudo apt install zsh tmux vim
```
2) Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/)
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
3) Install `.dotfiles`
```shell
git clone --recursive https://github.com/randName/dotfiles .dotfiles
cd .dotfiles && tools/install.sh
```

### Terminal Settings (Fonts, Colours)
The `vim` statusbar uses [Powerline fonts](https://github.com/powerline/fonts)

To install [Solarized](https://github.com/altercation/solarized) Dark on the Windows 10 Console, run `tools/solarized-dark.reg`
