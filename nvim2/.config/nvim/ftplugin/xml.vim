
set tabstop=2
set shiftwidth=2

let g:neoformat_xml_prettier = {
			\ 'exe': 'prettier',
			\ 'args': [
				\ '--tab-width', '2', 
				\ '--stdin-filepath', '"%:p"'],
			\ 'stdin': 1,
			\ }

augroup fmt
  autocmd!
  autocmd BufWritePre *.xml undojoin | Neoformat
augroup END


