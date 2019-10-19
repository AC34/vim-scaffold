
".vim
"
function! Highlight#Parser#ParseVim#Parse()
	let l:expr .= "let @/ =/'' \\s*\\(function\\|func/\\).*(.*).*\\n"
	let l:expr .= "\'"
	execute l:expr

endfunction
