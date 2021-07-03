#!/bin/bash

DIR=~/.myconfig/user_files

ln -sf $DIR/bash_aliases ~/.bash_aliases
ln -sf $DIR/bashrc ~/.bashrc
ln -sf $DIR/gitconfig ~/.gitconfig
mkdir -p ~/.git
ln -sf $DIR/git_hooks ~/.git/hooks
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/vimrc ~/.vimrc
ln -sf $DIR/xbindkeysrc ~/.xbindkeysrc
