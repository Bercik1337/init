#!/bin/bash
echo "Copying personal configuration to home directory"
cp -vur .bash_profile  .bashrc .nanorc .vimrc skrypty .bin .config .screenrc .selected_editor .bash-git-prompt ~/
cp -vur .config/.nano ~/.config/
source ~/.bashrc
