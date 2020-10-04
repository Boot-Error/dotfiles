" vim: set sw=4 ts=4 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Global Settings {

" leader is spacebar
let mapleader=" "

filetype on
syntax on
set hidden
set nohlsearch
set incsearch
set smartindent
set expandtab
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

set tabstop=4
set shiftwidth=4

set splitbelow
set splitright

set noswapfile
set nobackup

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" }

" Plugins {

" Imports {
call plug#begin('~/.nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vista.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-startify'

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'

Plug 'sbdchd/neoformat'
Plug 'kassio/neoterm'
Plug 'neomake/neomake'

Plug 'rustushki/JavaImp.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Themes
Plug 'cocopon/iceberg.vim'

call plug#end()

" }

" Plugin Settings {

set background=dark
colorscheme iceberg

let g:LanguageClient_serverCommands = {
	\ 'java': ['/usr/bin/jdtls'],
	\ }

" neoformatter settings for formatting on write
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

" }
" }

" Keymaps {

nnoremap <Leader>o :Clap files<cr>
nnoremap <Leader>b :Clap buffers<cr>
nnoremap <Leader>f :Clap grep<cr>
nnoremap <Leader>t :Clap tags<cr>

" lsp keybindings
nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" terminal mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <Esc><C-\><C-N><C-w>h
tnoremap <C-w>j <Esc><C-\><C-N><C-w>j
tnoremap <C-w>k <Esc><C-\><C-N><C-w>k
tnoremap <C-w>l <Esc><C-\><C-N><C-w>l
tnoremap <C-Esc> <Esc><C-\><C-N>:q<cr>

nnoremap <leader>t :20sp +term<cr>i
nnoremap <leader>T :vsp +term<cr>i

" Snippet bindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" }
