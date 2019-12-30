#!/bin/bash

	DOT_FILES=(.bashrc .vimrc .ideavimrc)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
