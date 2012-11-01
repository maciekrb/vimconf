"Maciek Ruckgaber (maciekrb@yahoo.com)
"Hecho 9 de Dic 2001
"Archivo de configuracion para el editor de texto vim (version gráfica)
" Pathogen config
call pathogen#infect()
call pathogen#helptags()
" FreeBSD Security advice
    set nomodeline
" =================================== Font and scren size ========================================"
"    set lines=50
"    set columns=105
    set guifont=*-Adobe-Courier-Medium-R-Normal--14-140-75-75-M-90-ISO8859-15
" Command line height
    set ch=2
" Start scroll up/down when cursor is 4 lines before viewport start/end
    set scrolloff=4  
" =============================== Indentation related ============================================="
" When interpreting indent chars, round to 2 indenting chars from whatever indent is
    set tabstop=2
" Number of spaces to use when indenting (<ctrl-T/ctrl-D>)
    set shiftwidth=2
" Interpret TAB as an indent command instead of an insert-a-tab command
    set softtabstop=2
" Always round to multiples of shiftwidth
    set shiftround       
" Causes TAB characters to not be used in the file for compression, and for only spaces to be used
    set expandtab
" Activate smartindenting (indent after { )
    set smartindent
" smartindent rule: Skip the rule that eliminates indents from # starting lines
    inoremap # X#
" Copy indentation from the line above when starting newline
    set autoindent       
" =============================== Highlighting related ==========================================="
    syntax on
" Highlight parenthesis and braces matching pair
    set showmatch
" Highlight search patterns (/ or ?)
    set hlsearch

    filetype on
    filetype plugin on
    filetype indent on
" Work nicely with MacVim
    set clipboard=unnamed

" Deshacer, 70 debe ser suficiente!!!

    set undolevels=70

" ignora las extensiones de este tipo
    set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.pyc,.sql3


        
" esconde mouse cuando se edita texto

  "set mousehide

" establece tab como wildcard para desplegar dirs y archivos
    set   wildchar=<TAB>

" Hace shift-insert funcionar como en Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

" Funciona el Backspace!!!!!
 
    set backspace=2  

"      set nu

" Backups

    set backup
    set backupdir=$HOME/vimbackups

"--------------------------------------------------
" winmanager
"-------------------------------------------------- 
  "map <c-b> :WMToggle<CR>
  "map <c-w><c-b> :BottomExplorerWindow<CR>
  "map <c-w><c-f> :FirstExplorerWindow<CR>
  map <c-h> :FirstExplorerWindow<CR>
  map <c-j> :BottomExplorerWindow<CR>
  let g:winManagerWidth=30
  let g:defaultExplorer=0
  let g:winManagerWindowLayout = 'FileExplorer,TagList|BufExplorer'
  let g:persistentBehaviour=0
  let g:TagsExplorer_title = "[Tag List]"
  
"--------------------------------------------------
" MiniBufExplorer
"-------------------------------------------------- 

"    let g:miniBufExplMapWindowNavVim = 1 
"    let g:miniBufExplMapWindowNavArrows = 1 
"    let g:miniBufExplMapCTabSwitchBufs = 1 
"    let g:miniBufExplModSelTarget = 1 
"    let g:miniBufExplSplitToEdge = 0 
"    let g:miniBufExplSplitBelow = 1

"--------------------------------------------------------
" NerdTree Config
"--------------------------------------------------------
  map <c-b> :NERDTreeToggle<CR>
"--------------------------------------------------------
" Tag List Plugin Config
"--------------------------------------------------------
" Path de exctags
  "let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
  let Tlist_Exit_OnlyWindow = 1
  let Tlist_Auto_Refresh = 1 
  map T :TaskList<CR>
  map E :TlistToggle<CR>
"--------------------------------------------------
" corrector ortografico
"-------------------------------------------------- 

    let loaded_vimspell = 1 "disble vimspell
    let spell_executable = "aspell"
    let spell_options = ""
    let spell_insert_mode = 0
    let spell_aspell_tex_args = "-t"
    let spell_root_menu = "-"
    let spell_auto_type="tex,mail,cvs,text"
    let spell_language_list = "spanish,en,polish"
    "map ^s :w!<CR>:!aspell check %<CR>:e! %<CR>

"--------------------------------------------------
" Status line 
"-------------------------------------------------- 

    set showmode
    set showcmd

    set laststatus=2
    set   shell=/bin/bash

"--------------------------------------------------
" Browser Settings
"-------------------------------------------------- 
    map \p :SearchUsing php 

    set background=dark

"--------------------------------------------------
" Format XMLline 
"-------------------------------------------------- 
    "map <c-x><c-x> :1,$!xmllint --format --recover -<CR>
    map <c-x><c-x> :1,$!xmllint --format --recover - 2>/dev/null<CR>

"--------------------------------------------------
" Tidy HTML 
"-------------------------------------------------- 
    map <c-x><c-t> :1,$!tidy -indent -asxhtml -utf8 -omit - 2>/dev/null<CR>

"-------------------------------------------------- 
" Case hacks
"-------------------------------------------------- 
    " Titlise Visually Selected Text (map for .vimrc)
    vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
    " Title Case A Line Or Selection (better)
    vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
    " titlise a line
    nmap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
    " Uppercase first letter of sentences
    ":%s/[.!?]\_s\+\a/\U&\E/g
"--------------------------------------------------
" CSV Settings
"-------------------------------------------------- 
  "autocmd BufNewFile,BufRead *.csv setf csv

"--------------------------------------------------
" VimCommander mappings
"--------------------------------------------------

  noremap <silent> <F11> :cal VimCommanderToggle()<CR>

"--------------------------------------------------
" MacOsX pbcopy mappings
"--------------------------------------------------
map <Leader>gc :w !pbcopy<CR><CR>

"--------------------------------------------------
" Fugitive
"--------------------------------------------------
  map <Leader>gs :Gstatus<CR>
  map <Leader>gh :Gsdiff
  map <Leader>gd :Gdiff<CR>
  map <Leader>gl :Glog -- %<CR>

"--------------------------------------------------
" FuzzyFinder mappings
"--------------------------------------------------
  map <Leader>fb :FufBuffer<CR>
  map <Leader>ff :FufFile<CR>
  map <Leader>fc :FufCoverageFile<CR>
  map <Leader>fd :FufDir<CR>
  map <Leader>fr :FufMruFile<CR>
"------------------------------------------------------------
" Retab : TAB to spaces with shiftwidth and tabstop settings 
"------------------------------------------------------------
  autocmd BufWritePre *.py retab

"--------------------------------------------------
" FuzzyFinder menu
"--------------------------------------------------
"highlight Pmenu guifg=#ffffff guibg=#ff0000 gui=underline ctermfg=Yellow ctermbg=DarkBlue cterm=bold
"highlight PmenuSel ctermfg=Yellow ctermbg=DarkBlue cterm=bold


 colorscheme graygreen
