#!/bin/sh

# Backup old files
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.old
fi
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.old
fi
if [ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.old
fi

# Symlink to default locations
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/tmux.conf ~/.tmux.conf

ln -s $PWD/zsh ~/.zsh
ln -s $PWD/vim ~/.vim
