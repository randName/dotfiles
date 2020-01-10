export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

# untracked files will not make folder dirty, improves performance
DISABLE_UNTRACKED_FILES_DIRTY="true"

# custom folder (default: $ZSH/custom)
ZSH_CUSTOM=$HOME/.zsh

# load plugins
plugins=(git gitfast tmux)

# load functions
fpath=("$HOME/.zsh/functions" $fpath)

# init oh-my-zsh
source $ZSH/oh-my-zsh.sh

# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# machine-local configuration
[ -f $HOME/.zshlocal ] && source $HOME/.zshlocal

# load ifttt if key exists
[ -f $HOME/.ifttt ] && autoload -U ifttt

# User configuration
export LANG='en_SG.utf8'
export LC_ALL='en_SG.utf8'
export LESSCHARSET='utf-8'
export TZ='Asia/Singapore'

export EDITOR='vim'
bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

setopt AUTO_CD

# stuff that needs to be near the end

if [ -d $HOME/.pyenv ]; then
    export PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
