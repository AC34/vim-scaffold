"

"exit on 0
if g:scaffold_autofold_enable == 0 | finish | endif

function! Fold#AutoFold#Init()
 call s:Debug("AutoFold init:")

 "this only needs to be checked once
 if ! exists("g:auto_highlight_executed")
   call Highlight#AutoHighlight#Init() 
 endif
 
 let g:hl_list = s:ParseList()
 
 "these needs to be set
 set foldmethod=expr
 set foldexpr=Fold#AutoFold#Fold()
 set foldlevelstart=0
	
 let g:scaffold_autofold_executed = 0
endfunction

function! Fold#AutoFold#Fold()
	call s:Debug("Fold#AutoFold#Fold:")
	"indent number
  let l:in = 1 "default

  "leave first line unfoleded for esthetic reason
	if v:lnum ==# 1 | let l:in = 0 | endif

  let l:max = len(g:hl_list) 
	let l:count = 1

	call s:Debug("l:vnum=".v:lnum)

	while l:count < l:max

		let l:previous = g:hl_list[l:count-1]
		let l:current = g:hl_list[l:count]

		"unfold if current line is part of search result
		if l:current ==# v:lnum
			let l:in = 0

			let l:count = l:max
		endif

		let l:count += 1

	endwhile

	call s:Debug("setting line".v:lnum."to level ".l:in)

	return l:in
endfunction


"parses the jumps searched list and comes up with a list of number of lines to be
"highlighted
"returns the list(sorted)
function! s:ParseList()
	call s:Debug("ParseList:")

	execute("redir => l:jumplist | jumps | redir END")

	let l:jumplist = split(l:jumplist,"\n")
	call s:Debug("jumplist length=".len(l:jumplist))

	let l:hl_lines = []
 
	"add line numbers for jumping
	for line in l:jumplist
		let l:ln = str2nr(get(split(line),1,"0"))
		if l:ln > 0
	    call add(l:hl_lines, l:ln)
		endif
	endfor

	"sort from small numbers 
	call sort(l:hl_lines,'n')

  for s in l:hl_lines
    call s:Debug("l:hl_lines =".s)
	endfor

  return l:hl_lines
endfunction

function! s:Debug(message)
"only works when in debug mode function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_autofold_enable ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction

