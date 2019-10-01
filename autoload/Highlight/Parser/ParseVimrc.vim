
"vimrc specific

function! Highlight#Parser#ParseVimrc#Parse()
	echom "parseVimrc"
  "delegating process to .vim parser
  call Highlight#Parser#ParseVim#Parse()

endfunction
