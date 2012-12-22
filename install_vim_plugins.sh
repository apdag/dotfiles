#!/bin/bash


[[ -z $DOTVIM_DIR ]] && DOTVIM_DIR=~/.vim

BUNDLE_DIR=${DOTVIM_DIR}/bundle 

plugins=( \
	'https://github.com/scrooloose/syntastic.git' \
	'https://github.com/Lokaltog/vim-distinguished.git' \
	'https://github.com/tpope/vim-fugitive.git'
	)


mkdir -p ${BUNDLE_DIR} && cd ${BUNDLE_DIR}


for plugin in ${plugins[*]} 
do 
	echo -n "Installing $plugin: "
	git clone $plugin > /dev/null 2>&1 
	echo "DONE" 
done
