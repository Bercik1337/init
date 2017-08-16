#!/bin/bash
cd ./root
echo "Copying root files to /root"
cp -vr bin etc sbin skrypty .bashrc .profile .nanorc .vimrc /root
