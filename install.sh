#!/bin/bash

cd $HOME
rm .agignore
ln -s .myconfig/.agignore .
rm .bash_aliases
ln -s .myconfig/.bash_aliases .
rm .bashrc
ln -s .myconfig/.bashrc .
rm .gitconfig
ln -s .myconfig/.gitconfig .
rm .inputrc
ln -s .myconfig/.inputrc .
rm .rtorrent_plain.rc
ln -s .myconfig/.rtorrent_plain.rc .
rm .screenrc
ln -s .myconfig/.screenrc .
rm .ssh-ident
ln -s .myconfig/.ssh-ident .
rm .tmux.conf
ln -s .myconfig/.tmux.conf .
rm .vimrc
ln -s .myconfig/.vimrc .
rm .xbindkeysrc
ln -s .myconfig/.xbindkeysrc .
rm .ssh/config
ln -s ../.myconfig/.ssh/config .ssh/
echo done
