set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'rking/ag.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number

autocmd filetype ruby setlocal colorcolumn=80

" Fold ruby comments
autocmd filetype ruby setlocal fdm=expr
autocmd filetype ruby setlocal fde=getline(v:lnum)=~'^\\s#'?1:getline(prevnonblank(v:lnum))=~'^\\s#'?1:getline(nextnonblank(v:lnum))=~'^\\s*#'?1:0
autocmd filetype ruby highlight Folded ctermbg=black
autocmd filetype ruby highlight Folded ctermfg=black
