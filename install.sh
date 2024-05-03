#!/bin/sh
BASEDIR=$PWD
NVIMDIR=nvim
echo $BASEDIR
cd $BASEDIR

ln -sf ${PWD}/${NVIMDIR} ~/.config/nvim
