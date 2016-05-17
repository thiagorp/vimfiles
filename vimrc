set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-endwise'

call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number

autocmd filetype ruby setlocal colorcolumn=80
