"set nocompatible
set bg=dark

let g:zenburn_high_Contrast = 1
colorscheme zenburn

autocmd BufNewFile *.py 0r ~/.vim/templates/py.py
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

autocmd BufNewFile *.tex 0r ~/.vim/templates/mla
autocmd BufNewFile build.xml 0r ~/.vim/templates/build.xml
autocmd BufNewFile *.java 0r ~/.vim/templates/foo.java
autocmd BufNewFile *.c 0r ~/.vim/templates/foo.c
autocmd BufNewFile *.cpp 0r ~/.vim/templates/foo.cpp
autocmd BufNewFile *.h 0r ~/.vim/templates/foo.h
autocmd BufNewFile *.as 0r ~/.vim/templates/foo.as

nnoremap <F2> <ESC>:%s/foo/\=expand("%:r")<cr>

" C guidelines
set ai
set ts=4
set shiftwidth=4
set textwidth=80
set number
set tabpagemax=50
set nowrap 
"set expandtab
"set sw=4 
"set sts=4 

"ctag epicness
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;$HOME
" cpp tags
set tags+=$HOME/.vim/tags/cpp
set tags+=$HOME/.vim/tags/sfml

filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on

"shouldn't be needed anymore
set t_Co=256

if expand("%:t") =~ "^bzr_log*"
    set textwidth=70
    set filetype=none
    syn match commitComment "^#.*"
    hi link commitComment Comment
endif

" Java Stuff
if expand("%:e") == "java"
	abbr print System.out.println("");<esc>hhi
	abbr try try { <CR>
	abbr Int Integer
	hi javaParen ctermfg=108
	hi javaParen1 ctermfg=150
	hi javaStorageClass ctermfg=150
	set expandtab
	set sw=4 
	set sts=4 
endif

"split on f4 to header file
map <F4> :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F5> <C-w><C-w>

abbr fr0 for (int i=0; i<; ++i) {<CR><CR>}<esc>2k15l
abbr #i #include
abbr def__ def __init__(self):
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap { {<CR>}<esc>O<tab>

" C
autocmd BufRead *.c set nowrap 
autocmd BufRead *.c set ts=4
"autocmd BufRead *.c set expandtab
"autocmd BufRead *.c set sw=4 
"autocmd BufRead *.c set sts=4 

autocmd BufNewFile *.c set nowrap 
autocmd BufNewFile *.c set ts=4
"autocmd BufNewFile *.c set expandtab
"autocmd BufNewFile *.c set sw=4 
"autocmd BufNewFile *.c set sts=4 
" end C

" Python
autocmd BufRead *.py set nowrap 
autocmd BufRead *.py set ts=4
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set sw=4 
autocmd BufRead *.py set sts=4 

autocmd BufNewFile *.py set nowrap 
autocmd BufNewFile *.py set ts=4
autocmd BufNewFile *.py set expandtab
autocmd BufNewFile *.py set sw=4 
autocmd BufNewFile *.py set sts=4 
" end python
set hlsearch

command JC :exec ":!javac %:p"
command FM :exec "!eclipse -nosplash -application org.eclipse.jdt.core.JavaCodeFormatter -config  ~/java-gnome/mainline/.settings/org.eclipse.jdt.core.prefs %:p"

:set guioptions-=T
" eclim
let g:EclimBrowser='chromium'
"let g:EclimLogLevel=6
"nnoremap <F2> <ESC>:JavaDocSearch<cr>
"nnoremap <F11> <ESC>:Ant<cr>
nnoremap <F3> <ESC>:JavaImportMissing<cr>:JavaImportClean<cr>
map <C-]> :Texplore<cr>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" ActionScript Fun!
autocmd BufRead,BufNewFile *.as set ft=actionscript
autocmd BufRead,BufNewFile *.as set ai
autocmd BufRead,BufNewFile *.as set ts=4
autocmd BufRead,BufNewFile *.as set shiftwidth=4
autocmd BufRead,BufNewFile *.as set textwidth=80
autocmd BufRead,BufNewFile *.as set expandtab
autocmd BufRead,BufNewFile *.as set sw=4
autocmd BufRead,BufNewFile *.as set sts=4
