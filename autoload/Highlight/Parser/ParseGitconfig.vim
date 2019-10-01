function! Highlight#Parser#ParseGitconfig#Parse()

  execute "let @/ = '\^\\(\\s*\\[\\|\\[\\).*\\].*\\n'"
  
endfunction

