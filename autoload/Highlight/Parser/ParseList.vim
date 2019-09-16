
".list files

function! Highlight#Parser#ParseList#Parse()
	
  let l:file_name = expand("%:t") 

	"very particular files
	if l:file_name ==# "sources.list" 
		call s:ParseDebianSourcesList()
	  return 
  endif
		
endfunction

"debian's sources.list
function! s:ParseDebianSourcesList()
  execute "let @/ = '\^\\(^\\n\\)\\@<=#.*\\(\\n#\\s\\)*.*\\n\\(#\\s.*\\)\\@!'"
  execute "hi Search ctermfg=136 ctermbg=233"
endfunction
