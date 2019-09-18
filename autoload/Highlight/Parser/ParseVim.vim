
"vimrc specific

function! Highlight#Parser#ParseVim#Parse()
"not clause before the last \\n?
  let l:expr = "let @/ = \'^\\(\\n\\|\\s*\\n\\)\\@<=\".*\\n"."\\|"
  let l:expr .= "^\\s*\\(function\\|func/\\).*(.*).*\\n"
	let l:expr .= "\'"
	execute l:expr

endfunction
