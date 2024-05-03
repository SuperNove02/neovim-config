#!/usr/bin/env bash
BASEDIR=$PWD
NVIMDIR=nvim
echo $BASEDIR
cd $BASEDIR

ln -s ${PWD}/${NVIMDIR} ~/.config/nvim
