"AutoIndentCount stands for Auto Indent Count

"exit on 0
if g:scaffold_autoindent_enable ==# 0 | finish | endif

"interface from other classs to here
function! Indent#AutoIndentCount#Init()
  call s:Debug("Auto Indent:")  
  "load file and count
  let l:inputfile = expand("%:t")
  "exit on directory
  if isdirectory(l:inputfile) 
    echo "found to be directory. abort"
    return 0 
  endif

  "echo "file loaded".l:file
  let l:file = getline(0, '$')
  let l:lines = s:LoadLines(l:file) 
  
  call s:Debug("ret lines=".len(l:lines))
  "detect and decide indent unit
  call s:DetectIndentUnit(l:lines)
  "debug
  call s:Debug("highest spc score before updating=".s:highest_spc_score)  
  "only update settings when spaces are counted
  "tabs don't need changes
  if s:highest_spc_score > 0
    set shiftwidth=0 "with 0 follows tabstop
    set softtabstop=-1 "follows shiftwidth
    set smarttab "tab by shiftwidth at the beginning of the line
    "update tabstop
    execute "set tabstop=".s:highest_spc_score
    call s:Debug("tabstop updated")
  else
    call s:Debug("tabstop not updated.")
  endif

  let g:scaffold_autoindent_executed = 1
endfunction

"returns the detected character(s) for indentation
function! Indent#AutoIndentCount#Detected()
  return s:detected;
endfunction

"load the file up to maximum lines limitation
"file_lines are expected to be the raw lines of the files
function! s:LoadLines(file_lines)
  call s:Debug("LoadLines:")
  call s:Debug("lines=".len(a:file_lines))

  "-1 on when file is impossible to read
  if len(a:file_lines) == 0 | return -1 | endif

  "set counting limit
  let l:limit = len(a:file_lines)
  if l:limit > g:scaffold_autoindent_maxcount | let l:limit = g:scaffold_autoindent_maxcount | endif

  "only count length > 0 line
  let l:ret_lines = []
  let l:index = 0 "for actual assignment to ret_lines
  let l:count = 0 "for incremental lookup of file_line
  while l:count < l:limit
    "s:Debug("loading file, index=".l:count)
    "count only menaingful line
    if a:file_lines[l:count] != ""
      "forget about this line
      call add(l:ret_lines, a:file_lines[l:count])
      let l:index = l:index + 1
    endif
    "this counts up no matter what
    let l:count = l:count+1
  endwhile
  return l:ret_lines
endfunction

"prepares and comes up with final idea of what is used for indentation
function! s:DetectIndentUnit(lines)
  call s:Debug("DetectChars:")
  
  "Characteristics of the file
  "count up odd/even numbers
  let s:occurances ={}
  let s:spclines = 0 
  let s:tablines = 0
  let s:detected = ""
  let s:highest_spc_score = 0
 
  call s:CollectCharacteristics(a:lines)

  "if tab, no further process is needed
  if s:tablines > s:spclines
    "tab is just tab
    let s:detected = "  "
  endif

  if s:highest_spc_score > 0 
    "s:highest_spc_score can still be zero(e.g. no indent text)
    "in that case, doing nothing  
    let s:detected = s:createSpaces(s:highest_spc_score)
  endif

endfunction


"iterates through to count up some characteristics of each lines
"lines should only give meaningful(no empty) lines
function! s:CollectCharacteristics(lines)
  call s:Debug("CollectOccurances:")
  "count the occurances of the spaces of each lines
  for line in a:lines
    "spaces needs to be counted
    "tabs don't really have to be counted, so only detecting
    "count number of preceeding spaces/tabs as indent
    let l:spaces = matchend(line,"\\(\\s\\)\\@!")

    "if match(line,"\\s")==#0 | let s:spclines += 1 | endif
    if match(line,"\ ")==#0 | let s:spclines += 1 | endif
    if match(line,"\\t")==#0 | let s:tablines += 1 | endif
    
    "initialise
    if has_key(s:occurances,l:spaces) ==# 0 | let s:occurances[l:spaces] = 0 | endif
    
    "count up if dividable (length is greater than 0)
    if l:spaces > 0
     let s:occurances[l:spaces] += 1 
     call s:Debug("counted as [".l:spaces."][".line."]")
    endif
  endfor
  
  "debug: show current list
  call s:Debug("occurances length=".len(s:occurances))
  call s:Debug("spclines=".s:spclines)
  call s:Debug("tablines=".s:tablines)
  for l:key in keys(s:occurances)
      call s:Debug("occurances[".l:key."] =".s:occurances[l:key])
  endfor
  "update highest spc score
  call s:DetectSpacesUnit(a:lines)

endfunction "CollectCharacteristics

"using s:occurances and other variables to detect 
"lines should only give meaningful(no empty) lines
"updates s:highest_spc_score
function! s:DetectSpacesUnit(lines)
  call s:Debug("DetectSpacesUnit:")   
  
  "0,1 will be meaning less to start as divisor
  let l:divisor = 2
  let l:div_max = max(keys(s:occurances))
  let l:scores = {} 
  if has_key(s:occurances,1) ==# 0 | let s:occurances[1] = 0 | endif
  let l:scores[1] = s:occurances[1]

  while l:divisor <= l:div_max
    "both s:occurances,l:scores can be very patchy
    "this is totally dependant on the nature of the file
    if has_key(s:occurances,l:divisor) ==# 0 | let s:occurances[l:divisor] = 0 | endif
    if has_key(l:scores,l:divisor) ==# 0 | let l:scores[l:divisor] = s:occurances[l:divisor] | endif
    
    for dividend in keys(s:occurances)
      "score only if the spaces can be divided by divisor
      if (str2nr(dividend) % l:divisor) ==# 0 && dividend > l:divisor  

        "increment the score if only the spaces is greater than the dividend
        "withouot any division remainder
        let l:scores[l:divisor] += s:occurances[l:divisor]
      endif
    endfor

    let l:divisor += 1
  endwhile

  "debug
  call s:Debug("scores length=".len(l:scores))
  for l:key in keys(l:scores)
    call s:Debug("score[".l:key."] = ".l:scores[l:key])
  endfor 

  "update the s:highest_spc_score
  "remember the highest scores can be zero
  let l:max_key = -1
  let l:max = max(l:scores)
  for l:key in keys(l:scores)
    if l:scores[l:key] ==# l:max
      let s:highest_spc_score = l:key
      break
    endif
  endfor
  
endfunction

"creates concatenated spaces
function! s:createSpaces(length)
  let l:i = 1   
  let l:back = ""
  while l:i <= a:length
    let l:back .= " "
    let l:i += 1
  endwhile
  return l:back
endfunction

"only works when in debug mode
function! s:Debug(message)
  "only echo when debugging mode
  if g:scaffold_autoindent_enable ==# 2
    set cmdheight=4
    echom a:message
  endif
endfunction

