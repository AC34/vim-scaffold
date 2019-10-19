
"debian's sources.list

function! Highlight#Parser#ParseSourceslist#Parse()
  
  execute "let @/ = '\^\\(^\\n\\)\\@<=#.*\\(\\n#\\s\\)*.*\\n\\(#\\s.*\\)\\@!'"

endfunction
