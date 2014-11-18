set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
" Plugin 'file:///Users/dmcnish/downloads/syntastic'
Plugin 'vim-scripts/L9'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'glench/Vim-Jinja2-Syntax'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'chrisbra/csv.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-sensible'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-notes'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
