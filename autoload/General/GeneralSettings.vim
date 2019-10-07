
"abort on 0 is done previously
"so doing no abort here

function! General#GeneralSettings#Init()

	call s:Debug("general settings:")
	"checks global variables and resets to default if nothing found
	call s:LoadGeneralPresets()
	"call presets for additional functionallity
	call s:LoadAdditionalPresets
	"actually do settings basd on global variables starting with "scaffold_"
	call s:Configure()
	call s:Debug("general settings done.")

endfunction

function! s:LoadGeneralPresets()
	"incremental search
	if !exists('g:scaffold_incsearch_enable') | let g:scaffold_incsearch_enable = 1 | endif
	"text wrapping
	if !exists('g:scaffold_wrap_enable') | let g:scaffold_wrap_enable = 1 | endif
	
endfunction

function! s:LoadAdditionalPresets()

endfunction

function! s:Configure()
	call s:Debug("configuring:")
	"enabling incremental search
	if g:scaffold_incsearch_enable == 1 | set incsearch | endif	
	"enabling text wrapping
	if g:scaffold_wrap_enable == 1 | set wrap | endif

endfunction

"only works when in debug mode
function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_mode ==# 2
		set cmdheight=4
    echom a:message
	endif
endfunction

