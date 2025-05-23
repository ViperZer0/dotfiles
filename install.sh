#!/bin/bash
# Apply all symbolic links to where they're supposed to go
SOURCE_DIR=$(pwd)
CONFIG_DIR=$HOME/.config
mkdir -p $CONFIG_DIR

ln -sv -t $CONFIG_DIR $SOURCE_DIR/awesome
ln -sv -t $CONFIG_DIR $SOURCE_DIR/nvim
ln -sv -t ~ $SOURCE_DIR/.vimrc
ln -sv -t ~ $SOURCE_DIR/.bash_alias
ln -sv -t ~ $SOURCE_DIR/.bashrc
ln -sv -t ~ $SOURCE_DIR/.xprofile
ln -sv -t ~ $SOURCE_DIR/.gitconfig
ln -sv -t ~ $SOURCE_DIR/.gtkrc
ln -sv -t ~ $SOURCE_DIR/.XCompose
ln -sv -t ~ $SOURCE_DIR/.xinitrc
ln -sv -t ~ $SOURCE_DIR/.scripts
ln -sv -t $CONFIG_DIR $SOURCE_DIR/alacritty
ln -sv -t ~ $SOURCE_DIR/.editorconfig
ln -sv -t ~ $SOURCE_DIR/.omnisharp
ln -sv -t $CONFIG_DIR $SOURCE_DIR/picom.conf
ln -svrn user-systemd-services $CONFIG_DIR/systemd/user
ln -sv -t $CONFIG_DIR/pulse $SOURCE_DIR/pulse/default.pa
ln -sv -t $CONFIG_DIR $SOURCE_DIR/gpu-screen-recorder.env

# Make dir for rofi theme
mkdir $CONFIG_DIR/rofi
