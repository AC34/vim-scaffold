"abort on 0 is done previously
"so doing no abort here
function! General#GeneralSettings#Init()

  call s:Debug("general settings:")

  "checks global variables and resets to default if nothing found
  call s:LoadGeneralPresets()
  "call presets for additional functionallity
  call s:LoadAdditionalPresets()
  "actually do settings basd on global variables starting with "scaffold_"
  call s:ApplySettings()

  call s:Debug("general settings done.")

endfunction

function! s:LoadGeneralPresets()

  "incremental search (default=1)
  if !exists('g:scaffold_incsearch_enable') | let g:scaffold_incsearch_enable = 1 | endif
  "text wrapping (default=1)
  if !exists('g:scaffold_wrap_enable') | let g:scaffold_wrap_enable = 1 | endif
  "no swap file (default=1)
  if !exists('g:scaffold_noswap_enable') | let g:scaffold_noswap_enable = 1 | endif
  "enable utf-8 (default=1)
  if !exists('g:scaffold_utf8_enable') | let g:scaffold_utf8_enable = 1 | endif
  "undo levels. default = 500
  if !exists('g:scaffold_undolevels') | let g:scaffold_undolevels = 500 | endif
  "history. default = 500
  if !exists('g:scaffold_history') | let g:scaffold_history = 500 | endif
  "show numbers column (default=1)
  if !exists('g:scaffold_numberscolumn_enable') | let g:scaffold_numberscolumn_enable = 1 | endif
  "auto indentation on every new line (default=1)
  if !exists('g:scaffold_autoindent_enable') | let g:scaffold_autoindent_enable = 1 | endif
  "highlihght searched pattern (default=1)
  if !exists('g:scaffold_hlsearch_enable') | let g:scaffold_hlsearch_enable = 1 | endif
  "enable 256 colors (default=1)
  if !exists('g:scaffold_256colors_enable') | let g:scaffold_256colors_enable = 1 | endif
  "enable mouse (default=1)
  if !exists('g:scaffold_mouse_enable') | let g:scaffold_mouse_enable = 1 | endif
  "enable clipboard
  if !exists('g:scaffold_clipboard_enable') | let g:scaffold_clipboard_enable = 1 | endif
  "fold by syntax rules (default = 1)
  if !exists('g:scaffold_syntaxfold_enable') | let g:scaffold_syntaxfold_enable = 1 | endif
endfunction

function! s:LoadAdditionalPresets()

endfunction

function! s:ApplySettings()

  call s:Debug("configuring:")
  "enabling incremental search
  if g:scaffold_incsearch_enable == 1 | set incsearch | endif  
  "enabling text wrapping
  if g:scaffold_wrap_enable == 1 | set wrap | endif
  "no swap 
  if g:scaffold_noswap_enable == 1 |set noswapfile | endif
  "enable utf-8
  if g:scaffold_utf8_enable == 1 | set encoding=utf-8 | endif
  "undo levels
  if g:scaffold_undolevels > 0 | execute "set undolevels=".g:scaffold_undolevels | endif
  "history
  if g:scaffold_history> 0 | execute "set history=".g:scaffold_history  | endif
  "show numbers column
  if g:scaffold_numberscolumn_enable == 1 | set number | endif
  "autoindention always on on new lines
  if g:scaffold_autoindent_enable == 1 | set autoindent | endif
  "highlihght searched pattern
  if g:scaffold_hlsearch_enable == 1 | set hlsearch | endif
  "enable 256 colors
  if g:scaffold_256colors_enable == 1 | set t_Co=256 | endif
  "enable mouse
  if g:scaffold_mouse_enable == 1 | set mouse=a | endif
  "enable clipboard
  if g:scaffold_clipboard_enable == 1 
    if has('clipboard') == 1
      set clipboard=unnamedplus 
    endif
  endif
  "set folding method to syntax
  if g:scaffold_syntaxfold_enable == 1 | set foldmethod=syntax | endif
endfunction

"only works when in debug mode
function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_mode ==# 2
    set cmdheight=4
    echom a:message
  endif
endfunction

