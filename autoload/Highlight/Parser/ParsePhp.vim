
"php

function! Highlight#Parser#ParsePhp#Parse()

  "double backslashes are treated as \ when execute is called
  "@/ registers history of last search pattern
	"single quote must be escapd ' => \'
	let l:exp = "let @/ =\'"
  "search class declaration (with and without preceeding whitespaces and tabs.)
  let l:exp .= "^\\(class\\|\\s*class\\)\\s.*\\n"."\\|"
  "serach interfface declaration
	let l:exp .= "^\\(interface\\|\\s*interface\\)\\s.*\\n"."\\|"
	"search for plain functions
  let l:exp .= "^\\(function\\|\\sfunction\\)\\s,*\\n"."\\|"	
	"search for methods within classes and functions 
	let l:exp .= "^\\s*\\(public\\|private\\|protected\\)\\sfunction.*\\n"
	"end by adding single quote
  let l:exp .= "\'"

  execute l:exp

endfunction

