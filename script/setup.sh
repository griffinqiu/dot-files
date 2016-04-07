#!/bin/bash

set +e

echo "      _       _         __ _ _"
echo "   __| | ___ | |_      / _(_) | ___  ___"
echo "  / _\` |/ _ \| __|____| |_| | |/ _ \/ __|"
echo " | (_| | (_) | ||_____|  _| | |  __/\__ \\"
echo "  \__,_|\___/ \__|    |_| |_|_|\___||___/"
echo ""

echo "Pulling latest dot-files"
git pull

echo "Updating latest dot-files"
git submodule init
git submodule update

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setup git dot-files..."
rm -f ~/.gitconfig && ln -s $DIR/../.gitconfig ~/
rm -f ~/.gitignore_global && ln -s $DIR/../.gitignore ~/.gitignore

echo "Setup tmux dot-files..."
rm -f ~/.tmux.conf && ln -s $DIR/../.tmux.conf ~/

echo "Setup vim dot-files..."
rm -rf ~/.vim && ln -fs $DIR/../.vim ~/
rm -f ~/.vimrc && ln -s $DIR/../.vimrc ~/
rm -f ~/.gvimrc && ln -s $DIR/../.gvimrc ~/

echo "Updating latest vim plugins"
vim +PluginInstall +qall

echo "Done"
