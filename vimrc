"Maciek Ruckgaber (maciekrb@yahoo.com)
"Hecho 9 de Dic 2001
"Archivo de configuracion para el editor de texto vim (version gráfica)
" Pathogen config
call pathogen#infect()
call pathogen#helptags()

" Set xterm-256 compat
set t_Co=256

" FreeBSD Security advice
set nomodeline
set shell=/opt/local/bin/zsh

" Command line height
set ch=2
set showmode
set showcmd
set laststatus=2

" Start scroll up/down when cursor is 4 lines before viewport start/end
set scrolloff=4  

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

" Copy indentation from the line above when starting newline
set autoindent       
set foldmethod=indent
set foldlevel=99
  
" Syntax hightlighting ON
syntax on
filetype plugin indent on

" Highlight parenthesis and braces matching pair
set showmatch

" Highlight search patterns (/ or ?)
set hlsearch

" Work nicely with MacVim
set clipboard=unnamed

" 100 UNDO levels should be normally enough
set undolevels=100

" Lower priority to these extensions 
set suffixes=.aux,.bak,.dvi,.gz,.idx,.log,.ps,.swp,.tar,.pyc,.sql3

" Backspace behavior
set backspace=2  

" Backups
set backup
set backupdir=$HOME/vimbackups

" Lusty needs this
set hidden

set background=dark


"--------------------------------------------------------
" Highlighting
"--------------------------------------------------------
highlight SpellBad term=reverse ctermbg=Blue
highlight DiffAdd term=reverse cterm=bold ctermbg=darkgreen ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=darkred ctermfg=lightgrey 
highlight DiffText term=reverse cterm=bold ctermbg=red ctermfg=yellow
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

"--------------------------------------------------
" Mappings
"--------------------------------------------------
" smartindent rule: Skip the rule that eliminates indents from # starting lines
inoremap # X#

" Map line split in normal mode
nmap <C-j> i<CR><esc>

" Map Ctr-U to UPPERCASE last word in insert mode
imap <C-u> <esc>viwUwa

" MacOsX pbcopy mappings
vnoremap <Leader>pc :w !pbcopy<CR><CR>

" Titlise Visually Selected Text (map for .vimrc)
vnoremap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>

" Title Case A Line Or Selection (better)
vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]

" titlise a line
nnoremap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]

" Format XML
noremap <c-x><c-x> :1,$!xmllint --format --recover - 2>/dev/null<CR>

" Tidy HTML 
noremap <leader>tidy :1,$!tidy -indent -wrap 120 -asxhtml -utf8 - 2>/dev/null<CR>

" TaskList conf
nnoremap T :TaskList<CR>

" Spellcheck language EN
nnoremap <leader>spellen :setlocal spell spelllang=en_us<CR>

" Spellcheck language ES
nnoremap <leader>spelles :setlocal spell spelllang=es<CR>

" Dash documentation
noremap <leader>d :Dash<CR>

" Toggle tag bar
nnoremap <leader>l :TagbarToggle<CR>

" NerdTree Config
noremap <c-b> :NERDTreeToggle<CR>

" FuGitive git status
noremap <leader>gs :Gstatus<CR>

" FuGitive git sdiff
noremap <leader>gh :Gsdiff

" FuGitive git diff
noremap <leader>gd :Gdiff<CR>

" FuGitive git log
noremap <leader>gl :Glog -- %<CR>

" Vimrope PyLInt
nnoremap <leader>rl <Esc>:PyLint<CR>

" Vimrope Go To definition
noremap <leader>rj :RopeGotoDefinition<CR>

" Vimrope Go refactor
noremap <leader>rr :RopeRename<CR>

noremap <leader>rf :RopeFindFile<CR>
noremap <leader>ra :RopeCodeAssist<CR>
noremap <leader>rd :RopeShowDoc<CR>
noremap <leader>ro :RopeFindOccurrences<CR>
noremap <leader>rgc :PymodeRopeRegenerate<CR>

"py.test Execute the tests in current file
nnoremap <silent><Leader>tf <Esc>:Pytest file<CR>

"py.test Execute the tests in current class
nnoremap <silent><Leader>tc <Esc>:Pytest class<CR>

"py.test Execute the test in current method
nnoremap <silent><Leader>tm <Esc>:Pytest method<CR>

" cycle through test errors
nnoremap <silent><Leader>tn <Esc>:Pytest next<CR>
nnoremap <silent><Leader>tp <Esc>:Pytest previous<CR>
nnoremap <silent><Leader>te <Esc>:Pytest error<CR>
nnoremap <silent><Leader>ts <Esc>:Pytest session<CR>

" shift-insert like good old Xterm
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>

" GunDo
nnoremap <leader>gu :GundoToggle<CR>

" Ack finder
nnoremap <leader>a <Esc>:Ack!

"====================== Plugin conf =====================

"------------------------------------------------------------
" closetag 
"------------------------------------------------------------
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let b:closetag_html_style=1

"------------------------------------------------------------
" Dash search
"------------------------------------------------------------
let g:dash_map = {
  \ 'python'     : 'python2',
  \ 'javascript' : 'angularjs'
\ }

"-----------------------------------------------------------
" gist-vim
"------------------------------------------------------------
let g:gist_post_private = 1

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
" pyflakes
"--------------------------------------------------
"let g:pyflakes_use_quickfix = 0
"highlight clear SpellBad
"highlight SpellCap term=reverse cterm=underline
"highlight SpellRare term=reverse cterm=underline
"highlight SpellLocal term=reverse cterm=underline
"
"------------------------------------------------------------
" python-mode 
"------------------------------------------------------------
let g:pymode = 1
let g:pymode_virtualenv = 1
let g:pymode_doc = 0
let g:pymode_rope_completion=0
let g:pymode_rope_extend_complete=0
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_rope = 1

" code checking
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checker = "pyflakes,pylint"
let g:pymode_lint_checker = "pyflakes,pylint"
" add E501 for line width "
let g:pymode_lint_ignore = "E11,W0311,C0301,W0105,E121" 

"------------------------------------------------------------
" Rope
"------------------------------------------------------------
"let g:pymode_rope_autocomplete_map = '<S-tab>'
" Other stuff
let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace(); # XXX BREAKPOINT'

"------------------------------------------------------------
" Tagbar
"------------------------------------------------------------
 let g:tagbar_usearrows = 1

"------------------------------------------------------------
" vim-debug
"------------------------------------------------------------
let g:vim_debug_disable_mappings = 1

"------------------------------------------------------------
" Vim sessions
"------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

"------------------------------------------------------------
" Vimspell
"------------------------------------------------------------
"let loaded_vimspell = 1 "disble vimspell
"let spell_executable = "aspell"
"let spell_options = ""
"let spell_insert_mode = 0
"let spell_aspell_tex_args = "-t"
"let spell_root_menu = "-"
"let spell_auto_type="tex,mail,cvs,text"
"let spell_language_list = "spanish,en,polish"
""map ^s :w!<CR>:!aspell check %<CR>:e! %<CR>

"------------------------------------------------------------
" Retab : TAB to spaces with shiftwidth and tabstop settings 
"------------------------------------------------------------
autocmd BufWritePre *.py retab
autocmd BufWritePre *.js retab

"------------------------------------------------------------
" JSON niceties
"------------------------------------------------------------
  "au BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
  "au! Syntax json source $HOME/.vim/syntax/json.vim
au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! /opt/local/bin/json_xs-5.12 -f json -t json-pretty

"------------------------------------------------------------
"Markdown niceties
"------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
