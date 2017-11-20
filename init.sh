#!/bin/sh

files=".spacemacs .tmux.conf .vimperatorrc .Xauthority .Xdefaults .xinitrc .xmodmaprc .zshrc .zshrc.1"
for i in $files
do
    ln -s /home/$USER/.dotfiles/$i ~/$i
done
