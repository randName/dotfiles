# .dotfiles
Configuration files for zsh, vim and tmux

## Installing
1) Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/)
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
2) Install `.dotfiles`
```shell
git clone --recursive https://github.com/randName/dotfiles .dotfiles
cd .dotfiles && tools/install.sh
```

### Terminal Settings (Fonts, Colours)
The `vim` statusbar uses [Powerline fonts](https://github.com/powerline/fonts)

To install [Solarized](https://github.com/altercation/solarized) Dark on the Windows 10 Console, run `tools/solarized-dark.reg`
