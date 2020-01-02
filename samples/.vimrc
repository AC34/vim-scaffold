"This file is a sample .vimrc implementation 
"covering what common settings vim-scaffold
"automatically replaces.


"↑↓↓↓↓↓↓↓↓↓↓↓↓   vim-scaffold replaces these lines   ↓↓↓↓↓↓↓↓↓↓↓↓↓
"vim-scaffold automaticallly applies this settings if supported.
"//enable incremental search
set incsearch	
"//highlight search(ing) characters
set hlsearch
"//wrap wrods within screen
set wrap
"//no swap file
set noswapfile
"// encoding setting
set encoding=utf-8
"//set undo limit
set undolevels=500
"//set history limit
set history=500
"//show line number
set number
"//auto indentation on new lines
set autoindent
"//enable 256 colors
set t_Co=256
"//enable mouse
set mouse=a
"//enable clipboard on 
set clipboard=unnamedplus 
"//enable fold by syntax(goes well with vim-scaffold)
set foldmethod=syntax
"↑↑↑↑↑↑↑↑↑↑↑↑↑   vim-scaffold replaces these lines   ↑↑↑↑↑↑↑↑↑↑↑↑↑

"installtion demo
"below lines show how to install vim-scaffold through vim-plug.
"
"#-----------------Plugin installation by vim-plug-------------------------------"
"write plugs between begin() and end()
call plug#begin()

Plug 'ac34/vim-scaffold'

call plug#end()

"#-----------------Plugin installation-------------------------------"
