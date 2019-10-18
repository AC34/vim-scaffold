 Gday mate, this is 
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
.
 
<pre>Since 2019/10/19
Written by AC34
URL:https://github.com/AC34/vim-scaffold
</pre>
=============================================

Prerequisites
---------------------------------------------
You need to at least have "autocmd" compiled with your vim.

Introduction
---------------------------------------------
This is extractions of common settings and trivial functionalities from my .vimrc file into one plugin.  
By using this plugin, you'll benefit from shortening your .vimrc file and/or you 'll be given some trivial functionalities.  
Currently implemented functionalities and settings are as follows:  
- Functionalities
  - searching
    - automatic indentation detection
    - automatic highglight of some trivial files when they open
    - key mapping of &lt;Leader&gt;h for highlihgt search
  - folding
    - automatic folding level(columns) adjustment
	- indenting
	  - automatic tabstop update

- Settings(enabled)(only if supported)
  - incremental search
  - highlight search
  - text wrapping
  - no swap file
  - utf-8 compatibility
  - undolevels set to 500
  - history list set to 500
  - show line number column
  - 256 colors enabled
  - mouse
  - clipboard
  - foldmethod set to syntax

Installation
---------------------------------------------
An example: add the line below to your .vimrc file when you're using vim-plug(for other plugins, follow your plugin's tutorial).

#### [vim-plug](https://github.com/junegunn/vim-plug)
	`Plug 'AC34/vim-scaffold'`
then do `:PlugInstall`

Configuration
---------------------------------------------
#### Settings that go well with this plugin
There are some settings that go well with this plugin.
##### 1 Setting highlight colors
You want to set colors for highlighting.  
For command line vim, example might be as follows:
  `au BufEnter * execute "hi search ctermfg=179 ctermbg=NONE"
    \|  execute "hi Folded ctermfg=179 ctermbg=Black"`
##### 2 You might want to set Leader key
For toggling highlight on search by &lt;Leader&gt;
##### 3 Install syntax plugins
Syntax rules are needed for folding.
##### 4 Keymaps for jumping between folded lines
Tabs can be convenient:
	`nnoremap &lt;Tab&gt; zj`
	`nnoremap &lt;S-tab&gt; zk`
####% 5 set default tabstop
You will need default value for this when file is empty
here is how its done for setting it to 2.
	`tabstop=2`

#### Disabling features
You can choose to disable some settings by giving 0 to corresponding variables(in your vimrc).

disables whole plugin(still being installed.)  
	`let g:scaffold_mode = 0`

disables autoindent functionality  
	`let g:scaffold_autoindent_enable = 0`

sets max line numbers to use for analyzing indentation(to 500 lines in example below)  
	`let g:scaffold_autoindent_maxcount = 500`

disables auto highlight  
	`let g:scaffold_autohi_enable = 0`

disables highlight by &lt;Leader&gt;h  
	`let g:scaffold_leaderhighlight_enable = 0`

disables auto foldlevel(columns) settings
	`let g:scaffold_autofoldcol_enable = 0`

Author
---------------------------------------------
URL:https://github.com/AC34

License
---------------------------------------------
read LICENSE file.

Notes
---------------------------------------------
This plugin is developed on vim-gtk(debian).
might not work well with other kind of vims.

