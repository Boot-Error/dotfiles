
call plug#begin('~/.nvim/plugged')

" Plug 'junegunn/fzf', { 'dir'" '~/.fzf', 'do': './install -all' }
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

call plug#end()

set hidden

" let base16colorspace=256

let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" some settings

set tabstop=4
set shiftwidth=4
let mapleader="`"
colorscheme industry 
colorscheme gruvbox

" keymaps

imap <c-u> <esc>vbUwi

nnoremap <C-R> :set number! relativenumber!<cr>
nnoremap <CR> :nohlsearch<cr>
nnoremap <C-k> :TagbarToggle<cr>
nnoremap <leader>b :NERDTreeToggle<cr>
