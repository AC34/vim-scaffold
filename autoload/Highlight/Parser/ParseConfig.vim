
".config

function! Highlight#Parser#ParseConfig#Parse()

 	"almost the same as text but not expecting natural language
 	let l:exp = "let @/ = \'"
 	"for #
 	let l:exp .= "\\(^\\n\\)\\@<=\\s*#.*\\n\\(.*#.*\\)\\@<!"
 	let l:exp .= "\\|"
 	"for "
 	let l:exp .= "\\(^\\n\\)\\@<=\\s*\".*\\n\\(.*\".*\\)\\@<!"
 	let l:exp .= "\\|"
 	"for !
 	let l:exp .= "\\(^\\n\\)\\@<=\\s*\!.*\\n\\(.*\!.*\\)\\@<!"
 	"end of the regex
 	let l:exp .= "\'"
 	execute l:exp

endfunction
