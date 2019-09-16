
".desktop

function! Highlight#Parser#ParseDesktop#Parse()

  execute "let @/ = \'^\\(\\[\\).*\\]\\n\'"

endfunction
