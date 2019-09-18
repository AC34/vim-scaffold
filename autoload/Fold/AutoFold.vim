
"exit on 0
if g:scaffold_autofold_enable == 0 | finish | endif

"global accessible functions
function! Fold#AutoFold#Init()
 call s:Debug("AutoFold Init:")

 "this only needs to be checked once
 if !exists("g:auto_highlight_executed")
   call Highlight#AutoHighlight#Init() 
 endif
 
 "save current settings
 let l:foldmethod = &foldmethod
 let l:foldlevelstart = &foldlevelstart
 let l:modifiable = &modifiable 

 "update current settings 
 set foldmethod=manual
 set foldlevelstart=1 
 set modifiable

 "call folding function
 call Fold#AutoFold#Fold()

 "restore last settings
 execute "set foldmethod=".l:foldmethod
 execute "set foldlevelstart=".l:foldlevelstart
 if l:modifiable ==# 1 | set modifiable | endif
	
 let g:scaffold_autofold_executed = 0
endfunction


function! Fold#AutoFold#Fold()
  call s:Debug("Fold#AutoFold#Fold:")

	"unfold everything first
	silent! norm zR

  "abort on no search result
	silent! execute("redir => l:jumplist | jumps | redir end")
	if len(split(l:jumplist,"\n")) ==# 0 | return 0 | endif

	"get last line number
	silent! norm G
	let l:last_line = line(".")
	if l:last_line ==# 1 | return 0 | endif "file has only one line

  "back to start position
	silent! norm gg 
	let l:pos = line(".") "starting from 1
	let l:next = l:pos "next jump position
	let l:continue = 1 "0,1 as boolean 

	"continue while l:continue is on
  while l:continue ==# 1
		"go to next highlight(or first)
		silent! norm n 
		let l:pos = line(".") "remember current position

		"go to next highlight
		silent! norm n 
		"update next line
		let l:next = line(".")
		"go back to current line
		silent! norm N 

		"there is only one hump for jump
		if l:next ==# l:pos | let l:continue = 0 | break | endif

		if l:next < l:pos
			"next hump is younger number
			"fold by the last hump(if current line isn't the last line)
			if l:pos ==# l:last_line | let l:continue = 0 | break | endif
			silent! norm j
			silent! norm V
			silent! norm G
			silent! norm zf
			let l:continue = 0
			"end the loop
			break
		endif

		"the next hump is the next line, thus continuous humps
		if l:pos+1 ==# l:next | continue | endif

		"from here is the manual folding
		"go to the next line
		silent! norm j 
		"start visual mode(line)
    silent! norm V		
		"jump to right before next highlight position
		silent! norm n
		silent! norm k
		"fold selected lines
		silent! norm zf	
		"go back to the current postion	
		silent! norm N 
	endwhile

	"back to first jump
	silent! norm gg
	silent! norm n

endfunction

"local access only functions
"only works when in debug mode function! s:Debug(message)
function! s:Debug(message)
  if g:scaffold_autofold_enable ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction
