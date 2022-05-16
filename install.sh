#!/bin/bash

DIR=~/.myconfig/user_files

ln -sf $DIR/bash_aliases ~/.bash_aliases
ln -sf $DIR/bashrc ~/.bashrc
mkdir -p ~/.config/fish
ln -sf $DIR/config.fish ~/.config/fish/config.fish
ln -sf $DIR/gitconfig ~/.gitconfig
mkdir -p ~/.git
ln -sf $DIR/git_hooks ~/.git/hooks
mkdir -p ~/.config/micro
ln -sf $DIR/micro_settings.json ~/.config/micro/settings.json
ln -sf $DIR/micro_bindings.json ~/.config/micro/bindings.json
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/vimrc ~/.vimrc
ln -sf $DIR/xbindkeysrc ~/.xbindkeysrc
mkdir -p ~/.bashrc.d/
touch ~/.bashrc.d/local
