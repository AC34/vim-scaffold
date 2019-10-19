"sh is complex

function! Highlight#Parser#ParseSh#Parse()
	"bash
	"comment line
	let l:exp = "let @/ = '\^\\(^\\n\\)\\@<=#.*\\(\\n#\\)*.*\\n\\(#\\)\\@!"."\\|"
	"function 
	let l:exp .= "\\(function\\|//sfunction\\).*(.*).*\\n"
	let l:exp .= "'"
 execute l:exp
endfunction

