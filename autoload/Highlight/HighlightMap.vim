"set hls with Leader+g
"for switching highlight 


function! Highlight#HighlightMap#LeaderHighlight()
  if g:scaffold_leaderhighlight_enable ==# 0 | finish | endif
  
  "map leader + g
  nnoremap <Leader>g :set hlsearch!<CR>

endfunction
