".Xresources

function! Highlight#Parser#ParseXresources#Parse()
		let l:exp = "let @/ = '\^\\(^\\n\\)\\@<=!.*\\(\\n!\\)*.*\\n\\(!\\)\\@!"
		let l:exp .= "'"
		execute l:exp

endfunction
