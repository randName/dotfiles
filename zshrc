# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# Which plugins would you like to load?
plugins=(git gitfast tmux pure zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

bindkey -r '^L'

setopt AUTO_CD

# machine-local configuration
[ -f $HOME/.zshlocal ] && source $HOME/.zshlocal
