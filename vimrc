"Maciek Ruckgaber (maciekrb@yahoo.com)
"Hecho 9 de Dic 2001
"Archivo de configuracion para el editor de texto vim (version gr�fica)
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
    "set smartindent @deprecated
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

    "filetype off
    filetype plugin indent on
" Work nicely with MacVim
    set clipboard=unnamed

" 100 UNDO levels should be normally enough
    set undolevels=100

" Lower priority to these extensions 
    set   suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.pyc,.sql3

" shift-insert like good old Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

" Backspace behavior
    set backspace=2  

" Backups
    set backup
    set backupdir=$HOME/vimbackups

" Lusty needs this
  set hidden

"--------------------------------------------------------
" GunDo
"--------------------------------------------------------
  nnoremap <leader>gu :GundoToggle<CR>
"--------------------------------------------------------
" miniBufExplorer
"--------------------------------------------------------
  let g:loaded_minibufexplorer = 0
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplMapWindowNavVim = 1
  "map <Leader>mbc :CMiniBufExplorer<cr>
  "map <Leader>mbu :UMiniBufExplorer<cr>
  "map <Leader>mbt :TMiniBufExplorer<cr>

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
  map T :TaskList<CR>

"--------------------------------------------------
" corrector ortografico
"-------------------------------------------------- 
  nnoremap <leader>spellen :setlocal spell spelllang=en_us<CR>
  nnoremap <leader>spelles :setlocal spell spelllang=es<CR>

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
    set shell=/bin/bash

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
" vim-debug
"--------------------------------------------------
let g:vim_debug_disable_mappings = 1

"--------------------------------------------------
" PEP8
"--------------------------------------------------
"let g:pep8_map='<leader>8'

"--------------------------------------------------
" pydoc
"--------------------------------------------------
"let g:pydoc_cmd = '/opt/local/bin/pydoc2.7' 
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview

"--------------------------------------------------
" Vim sessions
"--------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos


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
" python-mode 
"------------------------------------------------------------
  let g:pymode_virtualenv = 1
  let g:pymode_doc = 0
  let g:pymode_rope_completion=0
  let g:pymode_rope_extend_complete=0
  let g:pymode_indent = 0
  let g:pymode_rope = 0

  " code checking
  let g:pymode_lint = 1
  let g:pymode_lint_on_write = 1
  let g:pymode_lint_checker = "pyflakes,pylint"
  let g:pymode_lint_checker = "pyflakes,pylint"
  " add E501 for line width "
  let g:pymode_lint_ignore = "E11,W0311,C0301,W0105,E121" 


  " Rope
  "let g:pymode_rope_autocomplete_map = '<S-tab>'
  " Other stuff
  let g:pymode_breakpoint_key = '<leader>b'
  "let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace(); # XXX BREAKPOINT'
  nmap <leader>rl <Esc>:PyLint<CR>

"--------------------------------------------------
" Vimrope
"--------------------------------------------------
  map <leader>rj :RopeGotoDefinition<CR>
  map <leader>rr :RopeRename<CR>
  map <leader>rf :RopeFindFile<CR>
  map <leader>ra :RopeCodeAssist<CR>
  map <leader>rd :RopeShowDoc<CR>
  map <leader>ro :RopeFindOccurrences<CR>
  map <leader>rgc :RopeGenerateAutoimportCache<CR>

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
  nmap <silent><Leader>ts <Esc>:Pytest session<CR>

"-----------------------------------------------------------
" gist-vim
"------------------------------------------------------------
 let g:gist_post_private = 1

"------------------------------------------------------------
" Dash search
"------------------------------------------------------------
  map <leader>d :Dash<CR>
  let g:dash_map = {
    \ 'python'     : 'python2',
    \ 'javascript' : 'angularjs'
  \ }
"------------------------------------------------------------
" closetag 
"------------------------------------------------------------
  autocmd FileType html,htmldjango,jinjahtml let b:closetag_html_style=1
  "autocmd FileType html,xhtml,xml,htmldjango,jinjahtml source ~/.vim/bundle/closetag/plugin/closetag.vim

"------------------------------------------------------------
" JSON niceties
"------------------------------------------------------------
  "au BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
  "au! Syntax json source $HOME/.vim/syntax/json.vim
  au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! /opt/local/bin/json_xs-5.12 -f json -t json-pretty
"--------------------------------------------------
" FuzzyFinder menu
"--------------------------------------------------
"highlight Pmenu guifg=#ffffff guibg=#ff0000 gui=underline ctermfg=Yellow ctermbg=DarkBlue cterm=bold
"highlight PmenuSel ctermfg=Yellow ctermbg=DarkBlue cterm=bold


"colorscheme graygreen
highlight DiffAdd term=reverse cterm=bold ctermbg=darkgreen ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=darkred ctermfg=lightgrey 
highlight DiffText term=reverse cterm=bold ctermbg=red ctermfg=yellow
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
