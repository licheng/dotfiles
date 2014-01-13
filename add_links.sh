#!/bin/bash

full_dir_path() {
    (
    cd $1
    pwd
    )
}

SCRIPT_PATH=`dirname "$0"`
SCRIPT_PATH=`full_dir_path "$SCRIPT_PATH"`

ln -s $SCRIPT_PATH/vimrc ~/.vimrc
ln -s $SCRIPT_PATH/zshrc ~/.zshrc
ln -s $SCRIPT_PATH/tmux.conf ~/.tmux.conf
ln -s $SCRIPT_PATH/gitconfig ~/.gitconfig
