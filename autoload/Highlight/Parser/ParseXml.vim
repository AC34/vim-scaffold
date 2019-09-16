
"Xml

function! Highlight#Parser#ParseXml#Parse()
  
  "start of the regex 
	let l:exp = "let \@ = \'"	
	"highlight up to level 2
	"let l:exp .= "^\\(<\\|\\s<)".l:depth.".*\\n" 
	"depth 1
	let l:exp .= "^\\<.*\\n" 
	"depth 2
	let l:exp .= "\\|"."\\s*"
  "end of the regex
	let l:exp .= "\'"

	"execute regex highlight
  execute l:exp	

endfunction
