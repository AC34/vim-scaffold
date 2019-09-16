
".gitignore

function! Highlight#Parser#ParseGitignore#Parse()

  execute "let @/ = '\^\\(^\\n\\)\\@<=#.*\\(\\n#\\)*.*\\n\\(#\\)\\@!'"
  
endfunction
