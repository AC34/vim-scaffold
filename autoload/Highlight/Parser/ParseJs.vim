
"javascript

function! Highlight#Parser#ParseJs#Parse()
	
	"start by single quote
	let l:exp = "let @/ = \'"
	"new operator for creating instance and assignment
	let l:exp .= ".*=\\s*new.*(.*\\n" 
	"declaration of functions with assignments 
	"e.g. const|let|var|window.onload = function 
	let l:exp .= "\\|".".*\\(const\\|let\\|var\\|.*\\.\\).*\=\\s*function.*\\n"
	"declaration of plain function
	let l:exp .= "\\|"."^\\(\\s*function\\|function\\).*\\n"
	"declaration of annonymous functions with brackets
	let l:exp .= "\\|".".*(.*function.*(.*).*\\n"
	"declaration of annonymous functions with assignments
	let l:exp .= "\\|"."^\\(const\\|let\\|var\\|.*\.\\).*\=>.*\\n"
	"close by adding single quote
	let l:exp .=	"\'"	
	"execute regex
	
	execute l:exp

endfunction
