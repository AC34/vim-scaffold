
"vimrc specific

function! Highlight#Parser#ParseVim#Parse()
"not clause before the last \\n?
  execute "let @/ = '\\(^\\n\\|^\\s*\\n\\)\\@<=\".*\\n'"

endfunction
