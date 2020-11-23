set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'othree/html5.vim'
Plug 'janko-m/vim-test'
Plug '/usr/local/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'neovimhaskell/haskell-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'

call plug#end()
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number

set undodir=~/.config/nvim/.undo//
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swp//

let mapleader=" "

autocmd filetype ruby setlocal colorcolumn=80

" Set the differenc cursor on insert mode

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Test mappings
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

" fzf
nnoremap <C-p> :GFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'left': '~100%' }
set rtp+=/usr/local/opt/fzf
command! -bang -nargs=? -complete=dir GFiles
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Solarized
set background=dark
colorscheme solarized8

" hpack
autocmd BufWritePost package.yaml silent !hpack --silent

" Make .sql files faster
let g:ftplugin_sql_omni_key = '<C-j>'

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
