
call plug#begin('~/.nvim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
" Plug 'vim-latex/vim-latex'
Plug 'tpope/vim-abolish'

call plug#end()

set hidden

" personal settings

set tabstop=4
set shiftwidth=4
let mapleader="`"
set splitbelow
set splitright

colorscheme industry 
colorscheme gruvbox

" keymaps

imap <c-u> <esc>vbUwi

nnoremap <leader>r :set number! relativenumber!<cr>
nnoremap <CR> :nohlsearch<cr>
nnoremap <C-k> :TagbarToggle<cr>
nnoremap <leader>b :NERDTreeToggle<cr>

nnoremap <leader>g :Goyo<cr>

nnoremap <leader>t :20sp term:///bin/zsh<cr>i
nnoremap <leader>T :vsp term:///bin/zsh<cr>i

tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <Esc><C-\><C-N><C-w>h
tnoremap <C-w>j <Esc><C-\><C-N><C-w>j
tnoremap <C-w>k <Esc><C-\><C-N><C-w>k
tnoremap <C-w>l <Esc><C-\><C-N><C-w>l
tnoremap <C-Esc> <Esc><C-\><C-N>:q<cr>

" rust settings

let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" latex settings
" let g:livepreview_previewer = 'zathura'
" let g:tex_flavor = 'pdflatex'
" let g:Tex_BibtexFlavor = 'biber'
