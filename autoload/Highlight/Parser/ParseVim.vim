
".vim
"
function! Highlight#Parser#ParseVim#Parse()
	let l:expr = "let @/ = \'^\\(\\n\\|\\s*\\n\\)\\@<=\".*\\n"."\\|"
	let l:expr .= "^\\s*\\(function\\|func/\\).*(.*).*\\n"
	let l:expr .= "\'"
	execute l:expr

endfunction
