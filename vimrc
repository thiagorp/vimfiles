set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-endwise'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdtree'
Plugin 'othree/html5.vim'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elixir-editors/vim-elixir'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'Shougo/vimproc.vim', { 'do': 'make' }
Plugin 'Shougo/neocomplete.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'alx741/vim-hindent'
Plugin 'w0rp/ale'

call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number

let mapleader=" "

autocmd filetype ruby setlocal colorcolumn=80

" Test mappings
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

" fzf
nnoremap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'left': '~40%' }
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Solarized
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Necoghc
let g:necoghc_enable_detailed_browse = 1

" ghcmod-vim
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync
map <silent> hit :GhcModTypeInsert<CR>
map <silent> ht :GhcModType<CR>
map <silent> htc :GhcModTypeClear<CR>

" ale
let g:ale_linters = { 'haskell' : ['ghc-mod', 'hlitnt', 'stack_build', 'stack_ghc'] }

" vim-hindent
let g:hindent_on_save = 1

" hpack
autocmd BufWritePost package.yaml silent !hpack --silent
