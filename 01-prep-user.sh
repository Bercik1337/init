#!/bin/bash
echo "Copying personal configuration to home directory"
cp -vur .bash_profile  .bashrc .nanorc .vimrc skrypty .bin .screenrc .selected_editor .bash-git-prompt ~/
cp -vur .config/.nano ~/.config/
cp -vur .config/htop .config/mc ~/.config/
source ~/.bashrc
