#! /bin/sh

# Create Sym Links
ln -s vimrc ../.vimrc
ln -s gvimrc ../.gvimrc

# Init and Update git submodules
git submodule init
git submodule update
