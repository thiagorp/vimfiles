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
Plug 'altercation/vim-colors-solarized'
Plug 'elixir-editors/vim-elixir'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'w0rp/ale'
Plug 'ElmCast/elm-vim'
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set number

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

let mapleader=" "

autocmd filetype ruby setlocal colorcolumn=80

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
set t_Co=256
colorscheme solarized
let g:solarized_termcolors=256

" ale
let g:ale_linters = { 'haskell' : ['hlint'] }
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
map <silent> <leader>d :ALEDetail<CR>

" vim-hindent
let g:hindent_on_save = 1

" hpack
autocmd BufWritePost package.yaml silent !hpack --silent

" elm-vim
let g:elm_format_autosave = 1

" Make .sql files faster
let g:ftplugin_sql_omni_key = '<C-j>'

" LanguageClient
"let g:LanguageClient_serverCommands = {
    "\ 'haskell': ['hie-wrapper', '--lsp'],
    "\ }

"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>


" Remove sidebars on MacVim
set guioptions=
