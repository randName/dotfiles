# .dotfiles
Configuration files for `zsh`, `tmux`, `vim` and many other things

very loosely based on [The Text Triumvirate](https://web.archive.org/web/20200414221857/https://www.drbunsen.org/the-text-triumvirate/)

## Installing

```sh
# install `zsh`, `tmux` and `vim`
sudo apt purge vim-tiny*
sudo apt install zsh tmux vim

# install oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh/)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install .dotfiles
git clone --depth 1 --recursive https://github.com/randName/dotfiles .dotfiles
.dotfiles/tools/install.sh
```

refer to [the wiki](https://github.com/randName/dotfiles/wiki) for more setup instructions
