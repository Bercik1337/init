#!/bin/bash
echo "Copying root files to /root"
cp -vr .bashrc .vimrc /root
cd ./root
cp -vr .bin bin etc sbin skrypty /root
