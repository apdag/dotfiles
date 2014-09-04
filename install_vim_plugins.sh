#!/bin/bash

#[[ -x $(which curl) ]] || echo 'Derp not found'; exit

[[ -z $DOTVIM_DIR ]] && DOTVIM_DIR=~/.vim

BUNDLE_DIR="${DOTVIM_DIR}/bundle"
AUTOLOAD_DIR="${DOTVIM_DIR}/autoload"
[[ -z $VIM_RC ]] && VIM_RC="${HOME}/.vimrc"
[[ -z $VUNDLE_RC ]] && VUNDLE_RC="${HOME}/.bundle.vim"

# Install anything we want to manually grab
# before installing Vundle.vim
plugins=( \
	'https://github.com/gmarik/Vundle.vim.git'
	)


mkdir -p ${AUTOLOAD_DIR}

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
vim -u "${PWD}/bundle.vim" +PluginInstall +qall
echo "DONE" 
