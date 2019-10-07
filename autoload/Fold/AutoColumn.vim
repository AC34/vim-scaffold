"exit on zero
if g:scaffold_autofoldcol_enable ==# 0 | finish | endif

function! Fold#AutoColumn#Init()
  "check weather vim supports folding
  if has("folding") ==# 0 | finish | endif

  call s:Debug("AutoColumn.vim:")
  "set foldlevel by counted level.can be zero
  let l:columns = s:CountMaxFoldLevel()
  let l:exec = "setlocal foldcolumn=".l:columns
  execute l:exec 
  call s:Debug("fold column setting done. =".l:columns)

endfunction

"returns 0 to maximum fold level
"loads file and tries to jump and count maximum fold levels
"requres folding to be loaded
function! s:CountMaxFoldLevel()
  call s:Debug("CountMaxFoldLevel:")

  let l:line = line(".")
  "move to the last line
  norm G
  let l:end = line(".")
  "back to the start line
  norm gg

  "search throuogh to find the deepest fold level
  let l:foldlevel = 0 "start from
  let l:continue = 1

  "move to the first hump
  norm zj

  "keep unfolding until everything is unfolded
  "increase level count on every fold
  while l:continue
    "update current line
    let l:line = line(".")
    "get current foldlevel line
    let l:currentlevel = foldlevel(l:line)
    "compare and update foldlevel count
    if l:currentlevel > l:foldlevel | let l:foldlevel = l:currentlevel | endif
    "unfold on need
    if l:currentlevel > 0 
      norm zo
    endif

    "move to the next line
    norm zj

    "quit if next line is the last
    if line(".") ==# l:line | let l:continue = 0 | endif
  endwhile

  call s:Debug("max fold level=".l:foldlevel)

  "close all folds when there is at least 1 fold
  if l:foldlevel > 0 
    norm zC
  endif
  "back to the start line
  norm gg
  
  "return the biggest foldlevel count
  return l:foldlevel
endfunction

"only works when in debug mode
function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_autofoldcol_enable ==# 2
    set cmdheight=4
    echom a:message
  endif
endfunction

