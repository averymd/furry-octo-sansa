#! /bin/sh
# link all files to the home directory, asking about overwrites
cd `dirname $0`
SCRIPT_DIR=`pwd`

cd $HOME
ln --symbolic --interactive $SCRIPT_DIR/vim/.vimrc
