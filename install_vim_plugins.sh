#!/bin/bash

#[[ -x $(which curl) ]] || echo 'Derp not found'; exit

[[ -z $DOTVIM_DIR ]] && DOTVIM_DIR=~/.vim

BUNDLE_DIR="${DOTVIM_DIR}/bundle"
AUTOLOAD_DIR="${DOTVIM_DIR}/autoload"
[[ -z $VIM_RC ]] && VIM_RC="${HOME}/.vimrc"
[[ -z $VUNDLE_RC ]] && VUNDLE_RC="${HOME}/.bundle.vim"

#plugins=( \
#	'git://github.com/altercation/vim-colors-solarized.git' \
#	'https://github.com/scrooloose/syntastic.git' \
#	'https://github.com/Lokaltog/vim-distinguished.git' \
#	'https://github.com/tpope/vim-fugitive.git' \
#	'https://github.com/Lokaltog/vim-powerline.git' \
#	'https://github.com/kien/ctrlp.vim.git' \
#	'https://github.com/scrooloose/nerdtree.git'
#	)

plugins=( \
	'https://github.com/gmarik/Vundle.vim.git'
	)


#echo -n "Installing Pathogen: "
#mkdir -p ${AUTOLOAD_DIR} && cd ${AUTOLOAD_DIR}
mkdir -p ${AUTOLOAD_DIR}
#curl -Sso pathogen.vim \
#    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
#echo "DONE"

mkdir -p ${BUNDLE_DIR} && pushd ${BUNDLE_DIR}


for plugin in ${plugins[*]} 
do 
	echo -n "Installing $plugin: "
	git clone $plugin > /dev/null 2>&1 
	echo "DONE" 
done

popd

echo -n "Linking RC files: "
ln -s "${PWD}/rc.vim" "${VIM_RC}"
ln -s "${PWD}/bundle.vim" "${VUNDLE_RC}"
echo "DONE" 

echo -n "Installing Plugins: "
vim +PluginInstall +qall
echo "DONE" 
