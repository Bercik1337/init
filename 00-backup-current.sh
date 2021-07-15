#!/bin/bash
echo "Creating backup of current settings"
cd ~/
tar cvf ~/backup.tar .bash_profile  .bashrc .nanorc .vimrc .tmux_bootstrap .tmux.conf .screenrc .selected_editor .screenrc .vimrc config/xfce4 .config/autostart .config/dconf
