 <pre>         _                                  
         (_)                                 
  __   __ _  _ __ ___  ______                
  \ \ / /| || '_ ` _ \|______|               
   \ V / | || | | | | |                      
    \_/  |_||_| |_| |_|   __        _      _ 
                    / _| / _|      | |    | |
   ___   ___  __ _ | |_ | |_  ___  | |  __| |
  / __| / __|/ _` ||  _||  _|/ _ \ | | / _` |
  \__ \| (__| (_| || |  | | | (_) || || (_| |
  |___/ \___|\__,_||_|  |_|  \___/ |_| \__,_|
                                             
                                             
</pre>
 
[![LICENSE](https://img.shields.io/github/license/AC34/vim-scaffold?color=10B07A)](https://github.com/AC34/vim-scaffold/blob/master/LICENSE)
![SINCE](https://img.shields.io/badge/since-2019%2F10%2F19-green?color=10B07A)
[![Author](https://img.shields.io/badge/Author-AC34-green?color=10B07A)](https://github.com/AC34/)
---
### Requirements
System:
  - ![requres vim8.1](https://img.shields.io/badge/Requirement-Vim%208.1%20or%20above-black)

Vim:
  - ![requires autocmd](https://img.shields.io/badge/Vim%20Requirement-autocmd-black)

Introduction
---------------------------------------------
Common settings, keybindigs and additional functionalities in one plugin, to get started with.

Currently implemented functionalities and settings are as follows:  
- Functionalities
  - searching
    - automatic searching of some trivial files when they open
				(This is to jump through content lines by n and N keys,instead of manually moving by k,l)
				(e.g. files like .bashrc)
				(You don't need this when you move with tagbars etc)
  - folding
    - automatic folding level(columns) adjustment
  - indenting
	  - automatic tabstop update

- keybindings
    - &lt;Leader&gt;g switching highlight search on/off with  

- Common settings to get started with(enabled)(only if supported)
  look at sample vimrc file for more detail 
[![sample vimrc](https://img.shields.io/badge/Sample-.vimrc-10B07A)](https://github.com/AC34/vim-scaffold/blob/master/samples/.vimrc)
  - incremental search
  - highlight search
  - text wrapping
  - no swap file
  - utf-8 compatibility
  - undolevels set to 500
  - history list set to 500
  - show line number column
  - 256 colors
  - mouse
  - clipboard
  - foldmethod set to "syntax"


### Installation
---

#### [vim-plug](https://github.com/junegunn/vim-plug)

your .vimrc

`Plug 'AC34/vim-scaffold'

`:PlugInstall`

### Configuration

#### Settings that go well with this plugin
There are some settings that go well with this plugin.

##### 1 Setting highlight colors
You want to set colors for highlighting.
p>
For command line vim, example might be as follows:
`au BufEnter * execute "hi search ctermfg=179 ctermbg=NONE"
	\|  execute "hi Folded ctermfg=179 ctermbg=Black"`

##### 2 You might want to set Leader key
For switching highlight on/off by &lt;Leader&gt;g
 (this used to be &lt;Leader&gt;h for a while. changed on 2020/06/21)

##### 3 Install syntax plugins
Syntax rules are needed for folding.

##### 4 Keymaps for jumping between folded lines
Tabs can be convenient:  
	`nnoremap <Tab> zj`  
	`nnoremap <S-tab> zk`  

##### 5 set default tabstop
You will need default value for this when file is empty
here is how its done for setting it to 2.  
	`tabstop=2`

#### Disabling Functionalities
You can choose to disable some settings by giving 0 to corresponding variables(in your vimrc).

disables whole plugin(still being installed.)  
	`let g:scaffold_mode = 0`

disables autoindent functionality  
	`let g:scaffold_autoindent_enable = 0`

disables auto highlight  
	`let g:scaffold_autohi_enable = 0`

disables highlight by &lt;Leader&gt;g 
	`let g:scaffold_leaderhighlight_enable = 0`

disables auto foldlevel(columns) settings  
	`let g:scaffold_autofoldcol_enable = 0`

#### Other Settings
sets max line numbers to use for analyzing indentation(to 500 lines in example below)  
	`let g:scaffold_autoindent_maxcount = 500`

### Notes

This plugin is developed on vim-gtk(debian).
might not work well with other kind of vims.

### changes
2020/06/21
replaced ":set hls"(enabling search) by &gt;Leader&ht; with ":set hlsearch!(switching highlight on/off)" by &gt;Leader&ht; key.


