#!/bin/bash
echo "Creating backup of current settings"
tar cvf ~/backup.tar .bash_profile  .bashrc .nanorc .vimrc