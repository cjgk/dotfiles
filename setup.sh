#!/bin/bash

ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/vim/.vimrc ~/.vimrc
ln -sf $(pwd)/bash/profile ~/.profile
ln -sf $(pwd)/shell/bashrc ~/.bashrc
ln -sf $(pwd)/git/gitconfig ~/.gitconfig
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf

echo "DONE"
