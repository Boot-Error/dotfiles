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
set cursorline
set autoread
set smarttab

set tabstop=4
set shiftwidth=4

set splitbelow
set splitright

set noswapfile
set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" }

" Plugins {

" Imports {
call plug#begin('~/.nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'liuchengxu/vista.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc for now
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-commentary'

Plug 'sbdchd/neoformat'
Plug 'kassio/neoterm'
Plug 'neomake/neomake'


Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/gv.vim'
Plug 'dense-analysis/ale'

Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'

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

" Hail FZF
nnoremap <leader>o :Files<cr>
nnoremap <leader>go :GFiles<cr>
nnoremap <leader>so :GFiles?<cr>
nnoremap <leader>b :Buffers<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader>f :RG<cr>


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

" CoC global settings {

inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <silent><expr> <c-n>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><c-N> pumvisible() ? "\<C-p>" : "\<C-h>"

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Browser CocDiagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    call CocActionAsync('doHover')
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <c-k>b :CocCommand explorer<CR>


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

" Zettelkasten settings
let g:zettel_fzf_command = "rg --files"

" }
