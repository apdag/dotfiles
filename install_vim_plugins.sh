#!/bin/bash

#[[ -x $(which curl) ]] || echo 'Derp not found'; exit

[[ -z $DOTVIM_DIR ]] && DOTVIM_DIR=~/.vim

BUNDLE_DIR=${DOTVIM_DIR}/bundle 
AUTOLOAD_DIR="${DOTVIM_DIR}/autoload"

plugins=( \
	'https://github.com/scrooloose/syntastic.git' \
	'https://github.com/Lokaltog/vim-distinguished.git' \
	'https://github.com/tpope/vim-fugitive.git' \
	'https://github.com/Lokaltog/vim-powerline.git' \
	'https://github.com/kien/ctrlp.vim.git' \
	'https://github.com/scrooloose/nerdtree.git'
	)


echo -n "Installing Pathogen: "
mkdir -p ${AUTOLOAD_DIR} && cd ${AUTOLOAD_DIR}
curl -Sso pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
echo "DONE"

mkdir -p ${BUNDLE_DIR} && cd ${BUNDLE_DIR}


for plugin in ${plugins[*]} 
do 
	echo -n "Installing $plugin: "
	git clone $plugin > /dev/null 2>&1 
	echo "DONE" 
done

