"set hls with Leader+h


function! Highlight#HighlightMap#LeaderHighlight()
	if g:scaffold_leaderhighlight_enable ==# 0 | finish | endif
  
  "map leader + h
  nnoremap <Leader>h :set hls<CR>

endfunction
