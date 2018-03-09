#!/bin/sh

files=".gitconfig .spacemacs .tmux.conf .vimperatorrc .Xauthority .Xdefaults .xinitrc .xmodmaprc .zshrc .zshrc.1 .zprofile"
for i in $files
do
    ln -s /home/$USER/.dotfiles/$i ~/$i
done
