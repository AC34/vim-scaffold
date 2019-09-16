
"debian's sources.list

function! Highlight#Parser#ParseSourceslist#Parse()
  
  execute "let @/ = '\^\\(^\\n\\)\\@<=#.*\\(\\n#\\s\\)*.*\\n\\(#\\s.*\\)\\@!'"
  execute "hi Search ctermfg=136 ctermbg=233"

endfunction
