#!/bin/bash

git submodule update --init --recursive

ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/vim/vimrc ~/.vimrc
ln -sf $(pwd)/shell/profile ~/.profile
ln -sf $(pwd)/shell/bashrc ~/.bashrc
ln -sf $(pwd)/git/gitconfig ~/.gitconfig
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/docker ~/.docker

if [ -e ~/.vim/vundlerc ]; then
    vim -u ~/.vim/vundlerc +PluginInstall +qall
fi

echo "DONE"
