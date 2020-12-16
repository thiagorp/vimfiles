set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'othree/html5.vim'
Plug 'janko-m/vim-test'
Plug '/usr/local/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'neovimhaskell/haskell-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'elzr/vim-json'
Plug 'sdiehl/vim-ormolu'
Plug 'LnL7/vim-nix'

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
let g:NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

" Gemfile
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

" Solarized
set termguicolors
" set background=dark
colorscheme vim-monokai-tasty

" hpack
autocmd BufWritePost package.yaml silent !hpack --silent

" Make .sql files faster
let g:ftplugin_sql_omni_key = '<C-j>'

" coc
nmap <silent> gd <Plug>(coc-definition)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" ormolu
let g:ormolu_command="fourmolu"
let g:ormolu_suppress_stderr=1
autocmd BufWritePre *.hs :call RunOrmolu()

" tmux navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
