
"sh, bash

function! Highlight#Parser#ParseSh#Parse()

  let l:expr =  "let @/ = '\^\\(^\\n\\|^\\s\\n\\|\\)\\@<=#.*\\(\\n#\\)*.*\\n\\(#\\)\\@!'"."\\|"
  let l:expr .= "^\\(//s//)function!\\s.*\\n"
  execute l:expr

endfunction
