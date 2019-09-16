"load settngs for this plugin
"if no settings was loaded, all settings are automatically enabled. 


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
if !exists('g:scaffold_autohi_enable')| let g:scaffold_autohi_enable = 1 | endif


"auto folding setting
"0 disabled
"1 enabled(default)
if !exists('g:scaffold_autofold_enable') | let g:scaffold_autofold_enable = 1 | endif


"performing each features

"autoindent
au BufEnter * call Indent#AutoIndentCount#Init()

"auto highlight
au BufEnter * call Highlight#AutoHighlight#Init()

"auto fold
au BufEnter * call Fold#AutoFold#Init()



