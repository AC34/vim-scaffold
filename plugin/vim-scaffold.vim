"load settngs for this plugin
"load enabling setting
"0 disabled
"1 enabled for usual purpose(default)
"2 enabled for debugging purpose
if !exists('g:scaffold_mode') | let g:scaffold_mode = 1 | endif
"exit on 0
if g:scaffold_mode == 0 | finish | endif

"load autoindentation setting
"0 disabled
"1 enabled(default)
"2 enabled for debugging purpose
if !exists('g:scaffold_autoindent_enable') | let g:scaffold_autoindent_enable = 1  | endif

"max line number of counting indent information
"defaults to 1000(as in not to let it read too long lines)
"too short lines will result in poor detection quality
if !exists('g:scaffold_autoindent_maxcount') | let g:scaffold_autoindent_maxcount = 1000 | endif

"load auto highlight setting
"0 disabled
"1 enabled(default)
"2 enabled for debugging purpose
if !exists('g:scaffold_autohi_enable')| let g:scaffold_autohi_enable = 1 | endif

"Leader+h to call :set hls
if !exists("g:scaffold_leaderhighlight_enable") | let g:scaffold_leaderhighlight_enable = 1 | endif

"auto folding setting
"0 disabled
"1 enabled(default)
"2 enabled for debugging purpose
if !exists('g:scaffold_autofold_enable') | let g:scaffold_autofold_enable = 1 | endif

"jump override for folds
"0 disabled
"1 enabled(default)
"2 enabled for debugging purpose
if ! exists("g:scaffold_override_Jumps") | let g:scaffold_overridejumps_enable = 1 | endif

"unfold by l, fold by Ctrl+h
"0 disabled
"1 enabled(default)
"2 enabled for debugging purpose
if ! exists("g:scaffold_hlfold_enable") | let g:scaffold_horopen_enable = 1 | endif

"performing each features
"autoindent
au BufCreate * call Indent#AutoIndentCount#Init()

"auto highlight
au BufCreate * call Highlight#AutoHighlight#Init()
au BufCreate * call Highlight#HighlightMap#LeaderHighlight()
"auto fold
au BufRead * call Fold#AutoFold#Init() 
au BufEnter * call Fold#FoldJumps#OverrideJumps() | call Fold#FoldJumps#ShowColumn()
