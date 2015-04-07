set nocompatible               " be iMproved
filetype off                   " required!
set exrc
set secure

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'agate/vim-align'
Plugin 'joonty/vdebug'
Plugin 'suan/vim-instant-markdown'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/syntastic'
Plugin 'tommcdo/vim-exchange.git'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tmhedberg/matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'FredKSchott/CoVim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'sdanielf/vim-stdtabs'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'

call vundle#end()            " required

let mapleader=","
let g:jshint_highlight_color = "Red"
nnoremap <leader>ff :%!js-beautify -j -q -B -f -<CR>

let g:ctrlp_extensions = ["tag"]
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 100
nnoremap <silent> <leader>F :ClearCtrlPCache<cr>\|:CtrlP<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

autocmd BufEnter *.hs set formatprg=pointfree

map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>
nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

nmap <leader>nt :NERDTreeToggle<CR>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <leader>c <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
autocmd FileType ruby nmap <buffer> <F2> <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <F2> <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <F2> <Plug>(seeing_is_believing-run)

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  " set guifont=Monaco:h14
  set guifont=Inconsolata-dz:h14
endif

filetype plugin on
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" GRB: sane editing configuration"
set expandtab
set autoindent
" set smartindent
set laststatus=2
set showmatch
set incsearch

" GRB: wrap lines at 78 characters
" set textwidth=78

" GRB: Highlight long lines
" Turn long-line highlighting off when entering all files, then on when
" entering certain files. I don't understand why :match is so stupid that
" setting highlighting when entering a .rb file will cause e.g. a quickfix
" window opened later to have the same match. There doesn't seem to be any way
" to localize it to a file type.
" function! HighlightLongLines()
"   hi LongLine guifg=NONE guibg=NONE gui=undercurl ctermfg=white ctermbg=red cterm=NONE guisp=#FF6C60 " undercurl color
" endfunction
" function! StopHighlightingLongLines()
"   hi LongLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE guisp=NONE
" endfunction
" autocmd TabEnter,WinEnter,BufWinEnter * call StopHighlightingLongLines()
" autocmd TabEnter,WinEnter,BufWinEnter *.rb,*.py call HighlightLongLines()
" hi LongLine guifg=NONE
" match LongLine '\%>78v.\+'

" GRB: highlighting search"
set hls

if has("gui_running")
  " GRB: set font"
  ":set nomacatsui anti enc=utf-8 gfn=Monaco:h12

  " GRB: set window size"
  :set lines=100
  :set columns=171

  " GRB: highlight current line"
  :set cursorline
endif

" GRB: set the color scheme
:set t_Co=256 " 256 colors
:set background=dark
:color zenburn

" GRB: hide the toolbar in GUI mode
if has("gui_running")
    set go-=T
end

" GRB: add pydoc command
:command! -nargs=+ Pydoc :call ShowPydoc("<args>")
function! ShowPydoc(module, ...)
    let fPath = "/tmp/pyHelp_" . a:module . ".pydoc"
    :execute ":!pydoc " . a:module . " > " . fPath
    :execute ":sp ".fPath
endfunction

" GRB: use emacs-style tab completion when selecting files, etc
set wildmode=longest,list,full
set wildmenu

set nowrap

" GRB: Put useful info in status line
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" GRB: clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" When hitting <;>, complete a snippet if there is one; else, insert an actual
" <;>
function! InsertSnippetWrapper()
    let inserted = TriggerSnippet()
    if inserted == "\<tab>"
        return ";"
    else
        return inserted
    endif
endfunction

if version >= 700
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    let Tlist_Ctags_Cmd='~/bin/ctags'
endif

function! RunTests(target, args)
    silent ! echo
    exec 'silent ! echo -e "\033[1;36mRunning tests in ' . a:target . '\033[0m"'
    silent w
    exec "make " . a:target . " " . a:args
endfunction

function! ClassToFilename(class_name)
    let understored_class_name = substitute(a:class_name, '\(.\)\(\u\)', '\1_\U\2', 'g')
    let file_name = substitute(understored_class_name, '\(\u\)', '\L\1', 'g')
    return file_name
endfunction

function! ModuleTestPath()
    let file_path = @%
    let components = split(file_path, '/')
    let path_without_extension = substitute(file_path, '\.py$', '', '')
    let test_path = 'tests/unit/' . path_without_extension
    return test_path
endfunction

function! NameOfCurrentClass()
    let save_cursor = getpos(".")
    normal $<cr>
    call PythonDec('class', -1)
    let line = getline('.')
    call setpos('.', save_cursor)
    let match_result = matchlist(line, ' *class \+\(\w\+\)')
    let class_name = ClassToFilename(match_result[1])
    return class_name
endfunction

function! TestFileForCurrentClass()
    let class_name = NameOfCurrentClass()
    let test_file_name = ModuleTestPath() . '/test_' . class_name . '.py'
    return test_file_name
endfunction

function! TestModuleForCurrentFile()
    let test_path = ModuleTestPath()
    let test_module = substitute(test_path, '/', '.', 'g')
    return test_module
endfunction

function! RunTestsForFile(args)
    if @% =~ 'test_'
        call RunTests('%', a:args)
    else
        let test_file_name = TestModuleForCurrentFile()
        call RunTests(test_file_name, a:args)
    endif
endfunction

function! RunAllTests(args)
    silent ! echo
    silent ! echo -e "\033[1;36mRunning all unit tests\033[0m"
    silent w
    exec "make!" . a:args
endfunction

function! JumpToError()
    if getqflist() != []
        for error in getqflist()
            if error['valid']
                break
            endif
        endfor
        let error_message = substitute(error['text'], '^ *', '', 'g')
        silent cc!
        exec ":sbuffer " . error['bufnr']
        call RedBar()
        echo error_message
    else
        call GreenBar()
        echo "All tests passed"
    endif
endfunction

function! RedBar()
    hi RedBar ctermfg=white ctermbg=red guibg=red
    echohl RedBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! GreenBar()
    hi GreenBar ctermfg=white ctermbg=green guibg=green
    echohl GreenBar
    echon repeat(" ",&columns - 1)
    echohl
endfunction

function! JumpToTestsForClass()
    exec 'e ' . TestFileForCurrentClass()
endfunction

" nnoremap <leader>m :call RunTestsForFile('--machine-out')<cr>:redraw<cr>:call JumpToError()<cr>
" nnoremap <leader>M :call RunTestsForFile('')<cr>
" nnoremap <leader>a :call RunAllTests('--machine-out')<cr>:redraw<cr>:call JumpToError()<cr>
" nnoremap <leader>A :call RunAllTests('')<cr>

" nnoremap <leader>a :call RunAllTests('')<cr>:redraw<cr>:call JumpToError()<cr>
" nnoremap <leader>A :call RunAllTests('')<cr>

" nnoremap <leader>t :call RunAllTests('')<cr>:redraw<cr>:call JumpToError()<cr>
" nnoremap <leader>T :call RunAllTests('')<cr>

" nnoremap <leader>t :call JumpToTestsForClass()<cr>

" highlight current line
set cursorline

set cmdheight=2

" Don't show scroll bars in the GUI
set guioptions-=L
set guioptions-=r

" Use <c-h> for snippets
let g:NERDSnippets_key = '<c-h>'

augroup myfiletypes
  "clear old autocmds in group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,cucumber,ejs set ai sw=2 sts=2 et
  autocmd FileType python set ai sw=4 sts=4 et
  autocmd FileType php set ai ts=4 sw=4 sts=4 noet
  autocmd FileType scss,sass,javascript set ai sw=2 sts=2 ts=2 et
augroup END

set switchbuf=useopen

autocmd BufRead,BufNewFile *.html source ~/.vim/indent/html_grb.vim
autocmd FileType htmldjango source ~/.vim/indent/html_grb.vim
autocmd! BufRead,BufNewFile *.sass set filetype=sass
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.ejs set filetype=html
" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>v :view %%

map <leader>z <c-w>o

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

set number
set numberwidth=5

if has("gui_running")
    " source ~/proj/vim-complexity/repo/complexity.vim
endif

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

map <leader>rm :BikeExtract<cr>

function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction

function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction

vnoremap <leader>rv :call ExtractVariable()<cr>
nnoremap <leader>ri :call InlineVariable()<cr>
" " Find comment
" map <leader>/# /^ *#<cr>
" " Find function
" map <leader>/f /^ *def\><cr>
" " Find class
" map <leader>/c /^ *class\><cr>
" " Find if
" map <leader>/i /^ *if\><cr>
" " Delete function
" " \%$ means 'end of file' in vim-regex-speak
" map <leader>df d/\(^ *def\>\)\\|\%$<cr>
" com! FindLastImport :execute'normal G<CR>' | :execute':normal ?^\(from\|import\)\><CR>'
" map <leader>/m :FindLastImport<cr>

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

" Always show tab bar
set showtabline=2

augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

set makeprg=python\ -m\ nose.core\ --machine-out

map <leader>y "*y

" Make <leader>' switch between ' and "
nnoremap <leader>' ""yls<c-r>={'"': "'", "'": '"'}[@"]<cr><esc>

" Map keys to go to specific files
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP public/stylesheets/sass<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CtrlPTag<cr>
map <leader>f :CtrlP<cr>

" CCB php quick code searches
map <leader>ga :CtrlP ~/src/ccb/application<cr>
map <leader>gr :CtrlP ~/src/ccb/resources<cr>


function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running tests
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

set winwidth=79
set nonumber
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
" set winheight=5
" set winminheight=5
" set winheight=999

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" nnoremap <c-n> :let &wh = (&wh == 999 ? 10 : 999)<CR><C-W>=

function! ShowColors()
  let num = 255
  while num >= 0
    exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
    exec 'syn match col_'.num.' "ctermbg='.num.':...." containedIn=ALL'
    call append(0, 'ctermbg='.num.':....')
    let num = num - 1
  endwhile
endfunction

command! -range Md5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')

imap <c-l> <space>=><space>

function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

if &diff
  nmap <c-h> :diffget 1<cr>
  nmap <c-l> :diffget 3<cr>
  nmap <c-k> [cz.
  nmap <c-j> ]cz.
  set nonumber
endif

" In these functions, we don't use the count argument, but the map referencing
" v:count seems to make it work. I don't know why.
function! ScrollOtherWindowDown(count)
  normal! 
  normal! 
  normal! 
endfunction
function! ScrollOtherWindowUp(count)
  normal! 
  normal! 
  normal! 
endfunction
nnoremap g<c-y> :call ScrollOtherWindowUp(v:count)<cr>
nnoremap g<c-e> :call ScrollOtherWindowDown(v:count)<cr>

set shell=bash

" Can't be bothered to understand the difference between ESC and <c-c> in
" insert mode
imap <c-c> <esc>

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
  " :normal! <<
  " :normal! ilet(:
  " :normal! f 2cl) {
  " :normal! A }
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Indent p tags
autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_folding = 1

let g:sqlutil_keyword_case = '\U'
let g:sqlutil_cmd_terminator = "\ngo"
let g:sqlutil_align_comma = 1

cmap <F3> <C-R>=strftime("%Y%m%d%H%M%S")<CR>

:set number
:set gcr=n:blinkon0

nnoremap <leader><leader>d :call PhpDocSingle()<CR>
vnoremap <leader><leader>d :call PhpDocRange()<CR>

set clipboard=unnamed
au BufEnter *.hs compiler ghc
let g:haddock_browser="/Applications/Google\ Chrome.app"
" vdebug
let g:vdebug_options = {
\'debug_file_level': 2,
\'watch_window_style': 'expanded',
\'marker_default': '*',
\'continuous_mode': 0,
\'ide_key': 'vagrant',
\'break_on_open': 1,
\'on_close': 'detach',
\'path_maps': {'/var/www/app': '/Users/cwinkelmann/Development/ccb'},
\'marker_closed_tree': '+',
\'timeout': 20,
\'port': 9000,
\'marker_open_tree': '-',
\'debug_window_level': 1,
\'server': '0.0.0.0'
\}
