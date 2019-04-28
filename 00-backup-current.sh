#!/bin/bash
echo "Creating backup of current settings"
tar cvf ~/backup.tar .bash_profile  .bashrc .nanorc .vimrc .tmux_bootstrap .tmux.conf .screenrc .selected_editor .screenrc .vimrc
