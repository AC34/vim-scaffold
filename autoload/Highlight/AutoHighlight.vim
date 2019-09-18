

"exit on 0
if g:scaffold_autohi_enable ==# 0 | finish | endif

function! Highlight#AutoHighlight#Init()

  call s:Debug("Auto Highlight:")
   
  "Parse File and obtain the list of lines of matches
	"this already highlights files
	call s:ParseFile()
  
  let g:scaffold_autohighlight_executed = 1

  set hls
endfunction

"Chooses and uses parser which suits for current file(by file attribute)
function! s:ParseFile()

	let l:file_name = expand("%:t")
  let l:dot = matchend(l:file_name,"\\.") "position of the last dot

  "execute
	let l:executed = 0

  "create parse script name by full name(without dot)
	let l:fullname = substitute(l:file_name,"\\.","","")
  let l:fullname = toupper(l:fullname[0:0]).tolower(l:fullname[1:strlen(l:fullname)])
	call s:Debug("fullname=".l:fullname)

  try
    execute "call Highlight#Parser#Parse".l:fullname."#Parse()"	
		call s:Debug("executed Highlight#Parser#Parse".l:fullname."#Parse()")
		return
	catch
	endtry

	"create parse script name by dot
	if l:dot > -1
		try
		"create parse script name with making first letter capital
  	  let l:attr_name = l:file_name[l:dot:strlen(l:file_name)]
  	  let l:attr_name = toupper(l:attr_name[0:0]).tolower(l:attr_name[1:strlen(l:file_name)])
		  let l:target = l:attr_name
		  execute "call Highlight#Parser#Parse".l:target."#Parse()"
		  call s:Debug("executed Highlight#Parser#Parse".l:target."#Parse()")
		  return
		catch
		endtry
	endif

	"last try is to parse it as text
  let l:target = "General"
	execute "call Highlight#Parser#Parse".l:target."#Parse()"
	call s:Debug("executed Highlight#Parser#Parse".l:target."#Parse()")
	return

endfunction

"only works when in debug mode
function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_autohi_enable ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction
