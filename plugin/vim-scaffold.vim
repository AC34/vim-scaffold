"Gday mate, this is 
"
"         _                                  
"        (_)                                 
" __   __ _  _ __ ___  ______                
" \ \ / /| || '_ ` _ \|______|               
"  \ V / | || | | | | |                      
"   \_/  |_||_| |_| |_|   __        _      _ 
"                   / _| / _|      | |    | |
"  ___   ___  __ _ | |_ | |_  ___  | |  __| |
" / __| / __|/ _` ||  _||  _|/ _ \ | | / _` |
" \__ \| (__| (_| || |  | | | (_) || || (_| |
" |___/ \___|\__,_||_|  |_|  \___/ |_| \__,_|
"                                            
"                                            
".
"Since 2019/10/19
"Written by AC34 
"URL:https://github.com/AC34/vim-scaffold

"check weather vim supports autocmd
if has("autocmd") ==# 0 | finish | endif


"load enabling setting
"0 disabled
"1 enabled for usual purpose(default)
"2 enabled for debugging purpose
if !exists('g:scaffold_mode') | let g:scaffold_mode = 1 | endif
"exit on 0
if g:scaffold_mode ==# 0 | finish | endif


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
if !exists('g:scaffold_autohi_enable') | let g:scaffold_autohi_enable = 1 | endif

"Leader+h to call :set hls
if !exists("g:scaffold_leaderhighlight_enable") | let g:scaffold_leaderhighlight_enable = 1 | endif

if !exists("g:scaffold_autofoldcol_enable") |  let g:scaffold_autofoldcol_enable = 1 | endif


"performing each features
"preload general settings
au VimEnter * call General#GeneralSettings#Init()

"autoindent
au BufEnter * call Indent#AutoIndentCount#Init()

"auto highlight
au BufEnter * call Highlight#AutoHighlight#Init()
au BufEnter * call Highlight#HighlightMap#LeaderHighlight()

au BufEnter * call Fold#AutoColumn#Init()


