#!/bin/bash
echo "Copying personal configuration to home directory"
cp -vr .bash_profile  .bashrc .nanorc .vimrc skrypty .bin .config .screenrc .selected_editor ~/
. ~/.bashrc
