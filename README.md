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
                                             
                                             
.
</pre>
 
<pre>Since 2019/10/18
Written by AC34
URL:https://github.com/AC34/vim-scaffold
</pre>
=============================================

Introduction
---------------------------------------------
This is an extraction of common settings and trivial functionalities from my .vimrc file into one plugin.  
By using this plugin, you'll benefit from shortening your .vimrc file, or and you 'll be given some trivial functionalities.  
Currently implemented functionalities and settings are as follows:
**** Functionalities
  * Automatic indentation detection
  * Automatic highglight of some trivial files(for jumping by n)
  * Automatic Folding
* Settings(enabled)(only if supported)
  * Incremental Search
  * Highlight search
  * Text Wrapping
  * no swap file
  * utf-8 compatibility
  * undolevels set to 500
  * history list set to 500
  * show line number column
  * 256 colors enabled
  * mouse
  * clipboard
  * foldmethod set to syntax

Installation
---------------------------------------------
An example: add the line below to your .vimrc file when you're using vim-plug(for other plugins, follow your plugin's tutorial).

#### [vim-plug](https://github.com/junegunn/vim-plug)
	Plug 'AC34/vim-scaffold'

then do :PlugInstall

Configuration
---------------------------------------------
You can choose to disable some settings by giving 0 to corresponding variables(in your vimrc).


Author
---------------------------------------------
URL:https://github.com/AC34

License
---------------------------------------------
read LICENSE file.
