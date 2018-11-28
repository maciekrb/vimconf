" vimrc file
" Maciek Ruckgaber <maciekrb@gmail.com>
" First wrote Dic 9 2001
" 
"
" 
"----------------------------------------------------------------------------
" Base config
"----------------------------------------------------------------------------
" 
" Pathogen load {{{
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
" }}}

" Config opts {{{
let mapleader=","

" Set xterm-256 compat
set t_Co=256

" FreeBSD Security advice
set nomodeline
set shell=/usr/local/bin/zsh

" Be fast with long files without line breaks
set synmaxcol=200

" Session opts 
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Command line height
set ch=2
set showmode
set showcmd
set laststatus=2

" Show current line number
set number
set relativenumber

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
set smartindent
set foldmethod=indent
set foldlevel=99
  
" Highlight parenthesis and braces matching pair
set showmatch

" Highlight search patterns (/ or ?)
set hlsearch

" Work nicely with MacVim
set clipboard=unnamed

" Faster redrawing
set ttyfast

" 100 UNDO levels should be normally enough
set undolevels=100

" fzf to runtime path
set rtp+=/Users/maciekrb/Lib/GO/src/github.com/junegunn/fzf/bin/fzf

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
noremap <leader>n :NERDTreeToggle<cr>

" Dash documentation
noremap <leader>- :Dash<cr>

" Quickly edit vimrc in split window
nnoremap <leader>ev :split $MYVIMRC<cr>

" Format JSON
noremap <leader>fjson :1,$!python -mjson.tool<cr>

" Format XML
noremap <leader>fxml :1,$!xmllint --format --recover - 2>/dev/null<cr>

" GunDo
nnoremap <leader>gu :GundoToggle<CR>

" H for strong left 
nnoremap H ^

" L for strong right 
nnoremap L $

" MacOsX pbcopy mappings
vnoremap <leader>pc :w !pbcopy<cr><cr>

" JSHint
noremap <leader>jsh :JSHintUpdate<CR>

" Run in node
noremap <leader>rn :Shell node %<cr>

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" Spellcheck language EN / ES {{{
nnoremap <leader>spellen :setlocal spell spelllang=en_us<cr>
nnoremap <leader>spelles :setlocal spell spelllang=es<cr>
" }}}

" Quickly source vimrc {{{
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
"
" Run Lint via pymode {{{
nnoremap <leader>sy :PymodeLint<cr>
" }}}

" Toggle tag bar {{{
nnoremap <leader>t :TagbarToggle<cr>
" }}}

"py.test  {{{
" Execute the tests in current file
nnoremap <silent><Leader>tf <Esc>:Pytest file<cr>

"py.test Execute the tests in current class
nnoremap <silent><Leader>tc <Esc>:Pytest class<cr>

"py.test Execute the test in current method 
nnoremap <silent><Leader>tm <Esc>:Pytest method<cr>


" cycle through test errors 
nnoremap <silent><Leader>tn <Esc>:Pytest next<cr>
nnoremap <silent><Leader>tp <Esc>:Pytest previous<cr>
nnoremap <silent><Leader>te <Esc>:Pytest error<cr>
nnoremap <silent><Leader>ts <Esc>:Pytest session<cr>
" }}}

" Tidy HTML {{{ 
noremap <leader>tidy :1,$!tidy -indent -wrap 120 -asxhtml -utf8 - 2>/dev/null<cr>
" }}}

" Titlising {{{
" titlise a line
nnoremap <leader>ul :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]

" Title Case A Line Or Selection (better)
vnoremap <leader>us :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
" }}}

" shift-insert like good old Xterm {{{
noremap <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
" }}}

" TaskList conf {{{
nnoremap <leader>v <Plug>TaskList
" }}}

" Go conf {{{
nnoremap ,godb  <Plug>(go-doc-browser) * :<C-U>call go#doc#OpenBrowser()<CR>
nnoremap ,gods  <Plug>(go-doc-split) * :<C-U>call go#doc#Open("new", "split")<CR>
nnoremap ,godv  <Plug>(go-doc-vertical) * :<C-U>call go#doc#Open("vnew", "vsplit")<CR>
nnoremap ,godt  <Plug>(go-doc-tab) * :<C-U>call go#doc#Open("tabnew", "tabe")<CR>
nnoremap ,god  <Plug>(go-doc) * :<C-U>call go#doc#Open("new", "split")<CR>
nnoremap ,got  <Plug>(go-def-tab) * :<C-U>call go#def#JumpMode("tab")<CR>
nnoremap ,gos  <Plug>(go-def-split) * :<C-U>call go#def#JumpMode("split")<CR>
nnoremap ,gov  <Plug>(go-def-vertical) * :<C-U>call go#def#JumpMode("vsplit")<CR>
nnoremap ,gox  <Plug>(go-def) * :<C-U>call go#def#Jump()<CR>
nnoremap ,goi  <Plug>(go-import) * :<C-U>call go#import#SwitchImport(1, '', expand('<cword>'), '')<CR>
nnoremap ,gob  <Plug>(go-build) * :<C-U>call go#cmd#Build(!g:go_jump_to_error)<CR>
nnoremap ,gor  <Plug>(go-run) * :<C-U>call go#cmd#Run(!g:go_jump_to_error, '%')<CR>
" }}}

"----------------------------------------------------------------------------
" Plugin conf 
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
let g:gist_show_privates = 1
" }}}

" miniBufExplorer {{{
let g:loaded_minibufexplorer = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
"map <Leader>mbc :CMiniBufExplorer<cr>
"map <Leader>mbu :UMiniBufExplorer<cr>
"map <Leader>mbt :TMiniBufExplorer<cr>
" }}}

" fugitive {{{
set diffopt+=vertical
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
"set statusline+=%{fugitive#statusline()}
" }}}

" PEP8 {{{
"let g:pep8_map='<leader>8'
" }}}

" python-mode  {{{
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_indent = 0
let g:pymode_lint = 0 " We use syntastic instead
let g:pymode_lint_signs = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_checker = "pylint"
"let g:pymode_lint_ignore = "E11,W0311,C0301,W0105,E121,E501" 
let g:pytmode_motion = 1
let g:pymode_options = 1
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_extend_complete = 0
let g:pymode_syntax = 1
let g:pymode_syntax_all = 0
let g:pymode_virtualenv = 1

" }}}

" Google Python style guide {{{
setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" }}}

" jedi {{{
let g:jedi#completions_command = '<C-n>'
let g:jedy#popup_on_dot = 0 
" }}}

" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_javascript_mri_args = "--strict"

let g:syntastic_typescript_checkers = ['tslint']

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
noremap <leader>ll :SyntasticCheck<CR>
noremap <leader>loff :SyntasticToggleMode<CR>

" }}}

" Tagbar {{{
 let g:tagbar_usearrows = 1
" }}}

" vim-debug  {{{
let g:vim_debug_disable_mappings = 1
" }}}

" vim-codefmt {{{
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
" }}}
"
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

" VimWiki {{{
let vimwiki_list = [{'path': '~/.vimwiki'}]
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
  autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown foldmethod=manual textwidth=90
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

" Python SuperTab completion {{{
"augroup python_complete
  "autocmd!
  ""autocmd filetype python let g:jedi#popup_on_dot = 1
  ""autocmd filetype python let g:SuperTabDefaultCompletionType = "context"
  "autocmd filetype python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"augroup end
" }}}
"
"------------------------------------------------------------
" JSON niceties
"------------------------------------------------------------
"au! Syntax json source $HOME/.vim/syntax/json.vim
"au FileType json command -range=% -nargs=* Tidy <line1>,<line2>! /opt/local/bin/json_xs-5.12 -f json -t json-pretty

"------------------------------------------------------------
" Custom functions
"------------------------------------------------------------
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang Buku
  \ call fzf#vim#grep(
  \   '~/.virtualenvs/main/bin/python ~/.virtualenvs/main/bin/buku -t --np ', 0, <bang>0)
