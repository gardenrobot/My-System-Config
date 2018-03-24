#!/bin/bash

cd $HOME
rm .agignore
ln -s .myconfig/agignore .agignore
rm .bash_aliases
ln -s .myconfig/bash_aliases .bash_aliases
rm .bashrc
ln -s .myconfig/bashrc .bashrc
rm .gitconfig
ln -s .myconfig/gitconfig .gitconfig
rm .inputrc
ln -s .myconfig/inputrc .inputrc
rm .rtorrent_plain.rc
ln -s .myconfig/rtorrent_plain.rc .rtorrent_plain.rc
rm .screenrc
ln -s .myconfig/screenrc .screenrc
rm .ssh-ident
ln -s .myconfig/ssh-ident .ssh-ident
rm .tmux.conf
ln -s .myconfig/tmux.conf .tmux.conf
rm .vimrc
ln -s .myconfig/vimrc .vimrc
rm .xbindkeysrc
ln -s .myconfig/xbindkeysrc .xbindkeys
echo done
