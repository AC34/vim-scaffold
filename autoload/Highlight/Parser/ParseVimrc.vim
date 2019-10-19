
"vimrc specific

function! Highlight#Parser#ParseVimrc#Parse()
  "delegating process to .vim parser
  call Highlight#Parser#ParseVim#Parse()

endfunction
