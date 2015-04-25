" vimrc file
" Maciek Ruckgaber <maciekrb@gmail.com>
" First wrote Dic 9 2001
" 
"
" 
"----------------------------------------------------------------------------
" Base config
"----------------------------------------------------------------------------
" {{{
" Pathogen config
call pathogen#infect()
call pathogen#helptags()

let mapleader=","

" Set xterm-256 compat
set t_Co=256

" FreeBSD Security advice
set nomodeline
set shell=/opt/local/bin/zsh

" Session opts 
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

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
" }}}

" Highlighting {{{
highlight SpellBad term=reverse ctermbg=Blue
highlight DiffAdd term=reverse cterm=bold ctermbg=darkgreen ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=darkred ctermfg=lightgrey 
highlight DiffText term=reverse cterm=bold ctermbg=red ctermfg=yellow
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 
" }}}

"----------------------------------------------------------------------------
" Mappings
"----------------------------------------------------------------------------

" smartindent rule: Skip the rule that eliminates indents from # starting lines
inoremap # X#

" Ctrl-j Line split in normal mode
nnoremap <c-j> i<cr><esc>

" Ctr-u to UPPERCASE last word in insert mode
inoremap <c-u> <esc>viwUwa

" Simple and double quote 
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Ack finder
nnoremap <leader>a <Esc>:Ack!

" NerdTree Config
noremap <leader>b :NERDTreeToggle<cr>

" Dash documentation
noremap <leader>d :Dash<cr>

" Quickly edit vimrc in split window
nnoremap <leader>ev :split $MYVIMRC<cr>

" Format XML
noremap <leader>fxml :1,$!xmllint --format --recover - 2>/dev/null<cr>

" FuGitive git diff
noremap <leader>gd :Gdiff<cr>

" FuGitive git sdiff
noremap <leader>gh :Gsdiff

" FuGitive git log
noremap <leader>gl :Glog -- %<cr>

" FuGitive git status
noremap <leader>gs :Gstatus<cr>

" GunDo
nnoremap <leader>gu :GundoToggle<CR>

" H for strong left 
nnoremap H ^

" L for strong right 
nnoremap L $

" MacOsX pbcopy mappings
vnoremap <leader>pc :w !pbcopy<cr><cr>

" Vimrope {{{
" Vimrope PyLInt
nnoremap <leader>rl <Esc>:PyLint<cr>

" Vimrope Go To definition
noremap <leader>rj :RopeGotoDefinition<cr>

" Vimrope Go refactor
noremap <leader>rr :RopeRename<cr>

noremap <leader>rf :RopeFindFile<cr>
noremap <leader>ra :RopeCodeAssist<cr>
noremap <leader>rd :RopeShowDoc<cr>
noremap <leader>ro :RopeFindOccurrences<cr>
noremap <leader>rgc :PymodeRopeRegenerate<cr>
" }}}

" Spellcheck language EN / ES {{{
nnoremap <leader>spellen :setlocal spell spelllang=en_us<cr>
nnoremap <leader>spelles :setlocal spell spelllang=es<cr>
" }}}

" Quickly source vimrc {{{
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Toggle tag bar {{{
nnoremap <leader>t :TagbarToggle<cr>
" }}}

"py.test Execute the tests in current file {{{
nnoremap <silent><Leader>tf <Esc>:Pytest file<cr>
" }}}

"py.test Execute the tests in current class {{{
nnoremap <silent><Leader>tc <Esc>:Pytest class<cr>
" }}}

"py.test Execute the test in current method {{{
nnoremap <silent><Leader>tm <Esc>:Pytest method<cr>
" }}}

" cycle through test errors {{{
nnoremap <silent><Leader>tn <Esc>:Pytest next<cr>
nnoremap <silent><Leader>tp <Esc>:Pytest previous<cr>
nnoremap <silent><Leader>te <Esc>:Pytest error<cr>
nnoremap <silent><Leader>ts <Esc>:Pytest session<cr>
" }}}

" Tidy HTML {{{ 
noremap <leader>tidy :1,$!tidy -indent -wrap 120 -asxhtml -utf8 - 2>/dev/null<cr>
" }}}

" titlise a line {{{
nnoremap <leader>ul :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
" }}}

" Title Case A Line Or Selection (better) {{{
vnoremap <leader>us :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
" }}}

" shift-insert like good old Xterm {{{
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
" }}}

" TaskList conf {{{
nnoremap <leader>v <Plug>TaskList
" }}}

"----------------------------------------------------------------------------
"========================= Plugin conf ======================
"----------------------------------------------------------------------------

" closetag  {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let b:closetag_html_style=1
" }}}

" Dash search {{{
let g:dash_map = {
  \ 'python'     : 'python2',
  \ 'javascript' : 'angularjs'
\ }
" }}}

" gist-vim {{{
let g:gist_post_private = 1
" }}}

" miniBufExplorer {{{
let g:loaded_minibufexplorer = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
"map <Leader>mbc :CMiniBufExplorer<cr>
"map <Leader>mbu :UMiniBufExplorer<cr>
"map <Leader>mbt :TMiniBufExplorer<cr>
" }}}

" Omnicompletion + Supertab {{{
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
" }}}

" PEP8 {{{
"let g:pep8_map='<leader>8'
" }}}

" pydoc {{{
"let g:pydoc_cmd = '/opt/local/bin/pydoc2.7' 
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview
" }}}

" pyflakes {{{
"let g:pyflakes_use_quickfix = 0
"highlight clear SpellBad
"highlight SpellCap term=reverse cterm=underline
"highlight SpellRare term=reverse cterm=underline
"highlight SpellLocal term=reverse cterm=underline
" }}}

" python-mode  {{{
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
" }}}

" Rope {{{
"let g:pymode_rope_autocomplete_map = '<S-tab>'
" Other stuff
let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace(); # XXX BREAKPOINT'
" }}}

" Tagbar {{{
 let g:tagbar_usearrows = 1
" }}}

" vim-debug  {{{
let g:vim_debug_disable_mappings = 1
" }}}

" Vimspell {{{
"let loaded_vimspell = 1 "disble vimspell
"let spell_executable = "aspell"
"let spell_options = ""
"let spell_insert_mode = 0
"let spell_aspell_tex_args = "-t"
"let spell_root_menu = "-"
"let spell_auto_type="tex,mail,cvs,text"
"let spell_language_list = "spanish,en,polish"
""map ^s :w!<CR>:!aspell check %<CR>:e! %<CR>
" }}}

"----------------------------------------------------------------------------
" Auto commands 
"----------------------------------------------------------------------------
" Retab : TAB to spaces with shiftwidth and tabstop settings  {{{
augroup file_retabs
  autocmd!
  autocmd BufWritePre *.py retab
  autocmd BufWritePre *.js retab
augroup END
" }}}

" Set file types and fold methods for different types of files {{{
augroup file_types
  autocmd!
  autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown foldmethod=manual
  autocmd BufRead,BufNewFile *.json setlocal filetype=json foldmethod=syntax
augroup END
" }}}

" Activate spelling for different types of files {{{
augroup filetype_spelling
  autocmd!
  autocmd FileType markdown setlocal spell spelllang=en_us
augroup END
" }}}

" Vim file folding {{{
augroup vimfile_folding
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker 
  autocmd FileType vim :normal! zM
augroup END
" }}}

"------------------------------------------------------------
" JSON niceties
"------------------------------------------------------------
"au! Syntax json source $HOME/.vim/syntax/json.vim
"au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! /opt/local/bin/json_xs-5.12 -f json -t json-pretty
