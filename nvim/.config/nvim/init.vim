" vim: set sw=4 ts=4 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Plugins {

call plug#begin('~/.nvim/plugged')

" Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-latex/vim-latex'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'vimwiki/vimwiki'
Plug 'aserebryakov/vim-todo-lists'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'neomake/neomake'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'cespare/vim-toml'

" Themes I have tried
" Plug 'adlawson/vim-sorcerer'
Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'morhetz/gruvbox'
" Plug 'Soares/base16.nvim'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" YouCompleteMe {{

" let g:ycm_autoclose_preview_window_after_completion=1
" inoremap <leader>G :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}

" Deoplete {

let g:deoplete#enable_at_startup = 1

" maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)


" }

" ALE {


" }

" { Animate vim

let g:animate#duration = 200.0
let g:fzf_layout = {
			\ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
			\ }

" }

" }

" personal settings {

filetype plugin on

let mapleader=" " " leader is SPACE

set hidden
set tabstop=4
set shiftwidth=4
set splitbelow
set splitright
set cursorline

set background=dark
set termguicolors
colorscheme deep-space

let g:deepspace_italics=1
let g:airline_theme='deep_space'

" let g:gruvbox_contrast_dark = 'hard'
" let g:base16_color_modifiers = {'Comment': 'fg=green'}


let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lengs#height_resize_max = 70

" }

" keymaps {

nnoremap <leader>r :set number! relativenumber!<cr>
nnoremap <C-k> :TagbarToggle<cr>

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>w :Windows<cr>

nnoremap <leader>g :Goyo<cr>

" terminal setting
nnoremap <leader>t :20sp term:///bin/zsh<cr>i
nnoremap <leader>T :vsp term:///bin/zsh<cr>i
nnoremap <leader>nt :tabnew term:///bin/zsh<cr>i

tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <Esc><C-\><C-N><C-w>h
tnoremap <C-w>j <Esc><C-\><C-N><C-w>j
tnoremap <C-w>k <Esc><C-\><C-N><C-w>k
tnoremap <C-w>l <Esc><C-\><C-N><C-w>l
tnoremap <C-Esc> <Esc><C-\><C-N>:q<cr>

" tasksh setting
nnoremap <leader>m :40sp term:///usr/bin/tasksh<cr>i
nnoremap <leader>M :vsp term:///usr/bin/tasksh<cr>i

" }

" commands {

command Todo :e project.todo

" }

" rust settings {

" let g:racer_cmd = 'racer'
" let g:racer_experimental_completer = 1
"
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)

" setup rust_analyzer LSP (IDE features)
" lua require'nvim_lsp'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
" autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Press Tab to scroll _down_ a list of auto-completions
" let g:SuperTabDefaultCompletionType = "<c-n>"
"
" augroup rust_config
" 	" fold style
" 	set foldmarker={,}
" 	set foldlevel=0
" 	set foldmethod=marker
" 	" delete any old autocommands
" 	au!
" 	" rustfmt on write using autoformat
" 	autocmd BufWrite *.rs :Autoformat
" augroup END
"
" nnoremap <leader>c :!cargo clippy
"
" }

" latex settings {
let g:livepreview_previewer = 'mupdf'
let g:tex_flavor = 'pdflatex'
let g:Tex_BibtexFlavor = 'biber'
" }

" python settings {

au FileType python setlocal
			\ tabstop=4
			\ softtabstop=4
			\ shiftwidth=4
			\ textwidth=79
			\ expandtab
			\ autoindent
			\ fileformat=unix
" \ foldmethod=indent
" \ foldlevel=0
			\ omnifunc=pythoncomplete#Complete

" }

" golang settings {

" }

" JSON settings {

au FileType json :%!python -m json.tool %<CR>

" }

" HTML/CSS settings {
"
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

au FileType html setlocal
			\ tabstop=2
			\ softtabstop=2
			\ shiftwidth=2
			\ expandtab


" }

" lua settings {

au FileType lua setlocal
			\ tabstop=2
			\ softtabstop=2
			\ shiftwidth=2
			\ textwidth=80
			\ expandtab
" }

" vimwiki {

let g:vimwiki_list = [
			\ {'path': '~/Documents/notes',
			\ 'template_path': '~/vimwiki/templates/',
			\ 'template_default': 'default',
			\ 'syntax': 'markdown',
			\ 'ext': '.md',
			\ 'path_html': '~/Documents/notes_html/',
			\ 'custom_wiki2html': '/home/booterror/dotfiles/scripts/pandoc/pandoc_md.sh',
			\ 'html_filename_parameterization': 1,
			\ 'template_ext': '.tpl'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

autocmd BufWritePre *.md :Vimwiki2HTML

" }
