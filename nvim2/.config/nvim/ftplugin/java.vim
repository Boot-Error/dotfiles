" formatter
let g:neoformat_enabled_java = ['prettier']

let g:neoformat_java_prettier = {
			\ 'exe': 'prettier',
			\ 'args': [
				\ '--tab-width', '4', 
				\ '--stdin-filepath', '"%:p"'],
			\ 'stdin': 1,
			\ }

set shiftwidth=4
set tabstop=4

augroup fmt
  autocmd!
  autocmd BufWritePre *.java undojoin | Neoformat
augroup END

let g:projectionist_heuristics = {
			\ "src/main/java/*.java": { "alternate": "src/test/java/{basename}Test.java", "type": "source" },
			\ "src/test/java/**/*Test.java": { "alternate": "src/main/java/{}.java", "type": "test" },
			\ "pom.xml": { "type": "pom" },
			\ "*.java": { "dispatch": "javac {file}" },
			\ "*": { "make": "mvn" }
			\ }
