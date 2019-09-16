"files without file attribute

function! Highlight#Parser#ParseGeneral#Parse()

	"this can be really diverse
	let l:exp = "let @/ = \'"
	"for #
	let l:exp .= "\\(^\\n\\)\\@<=\\s*#.*\\n\\(.*#.*\\)\\@<!"
	let l:exp .= "\\|"
	"for "
	let l:exp .= "\\(^\\n\\)\\@<=\\s*\".*\\n\\(.*\".*\\)\\@<!"
	let l:exp .= "\\|"
	"for !
	let l:exp .= "\\(^\\n\\)\\@<=\\s*\!.*\\n\\(.*\!.*\\)\\@<!"
	let l:exp .= "\\|"
	"a line starting with number plus some characters like "." "," space ":" ";"
	let l:exp .= "^\\(\\d\\+\\)\\(\.\\|\\,\\|\\s\\|\:\\|\;\\).*\\n"
	let l:exp .= "\\|"
	"paragraphs after empty line trailing empty line
	let l:exp .= "\\(^\\n\\)\\@<=.*\\n"
	"end of the regex
	let l:exp .= "\'"
	
	execute l:exp

endfunction
