
"toggle fold
"overrides n,N to zj,zk when there are available jumps
"when there are no folding poitns, then does nothing
function! Fold#FoldJumps#OverrideJumps()
  "load setting
	if g:scaffold_overridejumps_enable ==# 0 | finish | endif

  "only when humps are there
  silent! execute("redir => l:jumplist | jumps | redir end")
	if len(split(l:jumplist,"\n")) > 0 
		call s:Debug("remapping n and N")

		"override n,N mapping
		nnoremap n zj
		nnoremap N zk
	endif

endfunction

"enables foldopen by l
function! Fold#FoldJumps#EnableHlfold()
  call s:Debug("Fold#FoldJumps#EnableLUnfold:")

  if g:scaffold_hlfold_enable ==# 0 | finish | endif

  call s:Debug("enabling unfolding by l")

	"set foldopen=hor
	nnoremap l :silent! foldopen<CR>l
  nnoremap <C-h> :foldclose<CR><C-h>
endfunction

"debug
function! s:Debug(message)
  if g:scaffold_autofold_enable ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction



