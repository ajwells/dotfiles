#!/usr/bin/env bash

ln -s $PWD/.vim ~/.
ln -s $PWD/.vimrc ~/.
ln -s $PWD/.profile ~/.

vim +PluginInstall +qall
