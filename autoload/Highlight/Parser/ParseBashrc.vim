"bashrc


function! Highlight#Parser#ParseBashrc#Parse()
	"delegation to bash
	call Highlight#Parser#ParseSh#Parse()
endfunction

