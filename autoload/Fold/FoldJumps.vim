
"toggle fold
"overrides Tab-n,Shift-Tab to zj,zk when there are available jumps
"when there are no folding poitns, then does nothing
function! Fold#FoldJumps#OverrideJumps()

  "load setting
	if g:scaffold_overridejumps_enable ==# 0 | finish | endif

  "only when humps are there
  silent! execute("redir => l:jumplist | jumps | redir end")
	if len(split(l:jumplist,"\n")) > 0 
		call s:Debug("remapping n and N")
		"mapping
		nnoremap <Tab> zj
		nnoremap <S-Tab> zk
	endif
endfunction

"setting column to 1
function! Fold#FoldJumps#ShowColumn()
  if g:scaffold_showcolumn_enable ==# 1
		set foldcolumn=1
	endif
endfunction

"debug
function! s:Debug(message)
  if g:scaffold_autofold_enable ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction


