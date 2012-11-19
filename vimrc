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
    set foldmethod=indent
    set foldlevel=99
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

    set undolevels=100

" ignora las extensiones de este tipo
    set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.pyc,.sql3

" establece tab como wildcard para desplegar dirs y archivos
    set   wildchar=<TAB>

" Hace shift-insert funcionar como en Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

" Funciona el Backspace!!!!!
 
    set backspace=2  

" Backups

    set backup
    set backupdir=$HOME/vimbackups

"--------------------------------------------------------
" Omnicompletion + Supertab
"--------------------------------------------------------
 set ofu=syntaxcomplete#Complete
 let g:SuperTabDefaultCompletionType = "context"

"--------------------------------------------------------
" Tagbar
"--------------------------------------------------------
 let g:tagbar_usearrows = 1
 nnoremap <leader>l :TagbarToggle<CR>

"--------------------------------------------------------
" NerdTree Config
"--------------------------------------------------------
  map <c-b> :NERDTreeToggle<CR>
"--------------------------------------------------------
" Tag List Plugin Config
"--------------------------------------------------------
" Path de exctags
  "let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
  "let Tlist_Exit_OnlyWindow = 1
  "let Tlist_Auto_Refresh = 1 
  "map E :TlistToggle<CR>

"--------------------------------------------------------
"" TaskList conf
"--------------------------------------------------------
  map <Leader>td <Plug>TaskList

"--------------------------------------------------
" corrector ortografico
"-------------------------------------------------- 

    "let loaded_vimspell = 1 "disble vimspell
    "let spell_executable = "aspell"
    "let spell_options = ""
    "let spell_insert_mode = 0
    "let spell_aspell_tex_args = "-t"
    "let spell_root_menu = "-"
    "let spell_auto_type="tex,mail,cvs,text"
    "let spell_language_list = "spanish,en,polish"
    ""map ^s :w!<CR>:!aspell check %<CR>:e! %<CR>

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
    "map \p :SearchUsing php 


"--------------------------------------------------
" Format XMLline 
"-------------------------------------------------- 
    "map <c-x><c-x> :1,$!xmllint --format --recover -<CR>
    map <c-x><c-x> :1,$!xmllint --format --recover - 2>/dev/null<CR>

"--------------------------------------------------
" Tidy HTML 
"-------------------------------------------------- 
    map <leader>tidy :1,$!tidy -indent -wrap 120 -asxhtml -utf8 - 2>/dev/null<CR>

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
" VimCommander mappings
"--------------------------------------------------

" noremap <silent> <F11> :cal VimCommanderToggle()<CR>

"--------------------------------------------------
" MacOsX pbcopy mappings
"--------------------------------------------------
map <Leader>gc :w !pbcopy<CR><CR>


"--------------------------------------------------
" pyflakes
"--------------------------------------------------
"let g:pyflakes_use_quickfix = 0
"highlight clear SpellBad
highlight SpellBad term=reverse ctermbg=Blue
"highlight SpellCap term=reverse cterm=underline
"highlight SpellRare term=reverse cterm=underline
"highlight SpellLocal term=reverse cterm=underline
set background=dark

"--------------------------------------------------
" fuzzyfinder
"--------------------------------------------------
highlight Pmenu term=reverse ctermbg=Black ctermfg=Yellow
highlight PmenuSel term=reverse ctermbg=Yellow ctermfg=DarkBlue cterm=Bold

"--------------------------------------------------
" PEP8
"--------------------------------------------------
let g:pep8_map='<leader>8'

"--------------------------------------------------
" pydoc
"--------------------------------------------------
let g:pydoc_cmd = '/opt/local/bin/pydoc2.7' 
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"--------------------------------------------------
" Vimrope
"--------------------------------------------------
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"--------------------------------------------------
" Fugitive
"--------------------------------------------------
  map <leader>gs :Gstatus<CR>
  map <leader>gh :Gsdiff
  map <leader>gd :Gdiff<CR>
  map <leader>gl :Glog -- %<CR>

"--------------------------------------------------
" FuzzyFinder mappings
"--------------------------------------------------
  map <leader>fb :FufBuffer<CR>
  map <leader>ff :FufFile<CR>
  map <leader>fc :FufCoverageFile<CR>
  map <leader>fd :FufDir<CR>
  map <leader>fr :FufMruFile<CR>

"--------------------------------------------------
" Ack finder
"--------------------------------------------------
  nmap <leader>a <Esc>:Ack!

"------------------------------------------------------------
" Retab : TAB to spaces with shiftwidth and tabstop settings 
"------------------------------------------------------------
  autocmd BufWritePre *.py retab
  autocmd BufWritePre *.js retab

"------------------------------------------------------------
" py.test
"------------------------------------------------------------
  " Execute the tests
  nmap <silent><Leader>tf <Esc>:Pytest file<CR>
  nmap <silent><Leader>tc <Esc>:Pytest class<CR>
  nmap <silent><Leader>tm <Esc>:Pytest method<CR>
  " cycle through test errors
  nmap <silent><Leader>tn <Esc>:Pytest next<CR>
  nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
  nmap <silent><Leader>te <Esc>:Pytest error<CR>

"------------------------------------------------------------
" closetag 
"------------------------------------------------------------
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
  autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"--------------------------------------------------
" FuzzyFinder menu
"--------------------------------------------------
"highlight Pmenu guifg=#ffffff guibg=#ff0000 gui=underline ctermfg=Yellow ctermbg=DarkBlue cterm=bold
"highlight PmenuSel ctermfg=Yellow ctermbg=DarkBlue cterm=bold


"colorscheme graygreen
