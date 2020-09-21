#!/usr/bin/env bash

echo "Backup existing vim files to ~/.oldvim"
mkdir -p ~/.oldvim

mv ~/.vim ~/.vimrc ~/.vimlocal ~/.oldvim/

echo "Rsync dotfiles from git to $HOME"
rsync -avzprPH ./.vim* ~/

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install vim plugins"
vim +PluginInstall +qall
