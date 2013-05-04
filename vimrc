set nocompatible
filetype off 

let s:uname = system ("uname")



"Activate vundle and let it manage itself
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"And now all the bundles I want to use
"-------------------------------------------------------
Bundle 'https://github.com/vim-scripts/TaskList.vim'
Bundle 'https://github.com/vim-scripts/Tagbar'
Bundle 'https://github.com/vim-scripts/errormarker.vim'
Bundle 'https://github.com/vim-scripts/unimpaired.vim'
Bundle 'https://github.com/vim-scripts/YankRing.vim'
Bundle 'https://github.com/vim-scripts/ack.vim'
Bundle 'https://github.com/vim-scripts/The-NERD-Commenter'
Bundle 'https://github.com/vim-scripts/SuperTab-continued.'
Bundle 'https://github.com/vim-scripts/Screen-vim---gnu-screentmux'
Bundle 'https://github.com/vim-scripts/surround.vim'
Bundle 'https://github.com/vim-scripts/toggle_mouse'
Bundle 'https://github.com/vim-scripts/grep.vim'
Bundle 'https://github.com/vim-scripts/bufexplorer.zip'
Bundle 'https://github.com/vim-scripts/a.vim'
Bundle 'https://github.com/vim-scripts/SingleCompile'
Bundle 'https://github.com/vim-scripts/The-NERD-tree'
"Bundle 'https://github.com/vim-scripts/cscope_macros.vim'
Bundle 'https://github.com/vim-scripts/fugitive.vim'
Bundle 'https://github.com/vim-scripts/Lucius'
Bundle 'https://github.com/vim-scripts/bash-support.vim'
Bundle 'https://github.com/vim-scripts/git-file.vim'
Bundle 'https://github.com/vim-scripts/gtags.vim'
Bundle 'https://github.com/vim-scripts/listmaps.vim'
"Bundle 'https://github.com/vim-scripts/PreciseJump'

if s:uname != "SunOS\n"
    Bundle 'https://github.com/vim-scripts/Intelligent-Tags'
endif

if has('mac')
    Bundle 'Rip-Rip/clang_complete'
endif

"if has ('python')
"    Bundle 'SirVer/ultisnips'
"endif

Bundle 'gregsexton/gitv'
Bundle 'jnurmine/Zenburn'
Bundle 'kien/ctrlp.vim'
Bundle 'proyvind/Cpp11-Syntax-Support'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/clam.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nelstrom/vim-qargs'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'sollidsnake/vterm.git'
Bundle 'vim-peepopen'
"Bundle 'mihaifm/vimpanel'
"Bundle 'flazz/vim-colorschemes'
"Bundle 'godlygeek/csapprox'
"-------------------------------------------------------


syntax on
filetype plugin indent on

"source $VIMRUNTIME/vimrc_example.vim
set tags=./tags; "quantiqa-* 
set path+=./$HOST_TUPLE/include;quantiqa-*
set path+=./3rdParty/cal/$HOST_TUPLE/include;quantiqa-*
set path+=$GCCROOT/include/c++/**
set path+=$BOOSTROOT/include
set path+=$LLVMROOT/include


set mouse=a
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cursorline
set nobackup
set writebackup
set wildchar=<Tab> 
set wildmenu 
set wildmode=list:longest
set wildignore+=*.a,*.o,*.so,*.dylib,*.gz,*.tar,.DS_Store,*/.git/*,*/.hg/*,*/.svn/*
set scrolloff=3
set hidden
set makeprg=gmake
"set makeprg=osascript\ -e\ 'tell\ app\ \"Xcode\"\ to\ build'\ -e\ 'tell\ app\ \"MacVim\"\ to\ activate'
set incsearch
set hlsearch
set linebreak
set complete=.,w,b,u,t
"set shell=$HOME/bin/bash
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set history=1000
set undolevels=1000
set noerrorbells
set pastetoggle=<F2>
"set relativenumber
set wrap
set textwidth=79
set formatoptions=qrn1
set formatoptions-=o
"set colorcolumn=85
"set viminfo=!,<500,s10,'50,/50,:500,@500,h,%
set viminfo+=%
set cscopequickfix=s-,c-,d-,i-,t-,e-
set tildeop
set autoread
set clipboard=unnamed

if has ('conceal')
    set concealcursor=inv
    set conceallevel=2
endif

"let mapleader="\<space>"
let mapleader=","

au BufNewFile,BufRead *.cpp set syntax=cpp11

"AFTER SEEING VIMCAST
vnoremap . :norm.<CR>


command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction
""""""""""""""""""""""""""""""""""""""""""""""
 
 
 
 
 
"Disable cmake-indent which apparently screws up c/c++ indenting
let b:did_indent = 1

"neocomplcache ------------------------
"let g:neocomplcache_enable_at_startup = 1

"Always put quickfix window at the bottom of the window layout
autocmd FileType qf wincmd J

"Should let vim realize the file was externally changed
if ! s:uname == "SunOS"
    autocmd Cursorhold * checktime
endif

"Powerline ------------------------
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

"yankring ------------------------
let g:yankring_manual_clipboard_check=1

"ctrlp ----------------------------
let g:ctrlp_by_filename = 1
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

"EasyMotion ------------------------------ 
let g:EasyMotion_leader_key = 'ò'

"Hit F to follow log file
nmap <leader>_ :e<CR>GL:sleep 1<CR><leader>_

"easier use of cscope_map which is based on C-\
"nmap <C-_> <C-\>

"easy buffer navigation
nnoremap <leader>l :ls<CR>:b<space>

"distinguish errors from warnings in errormarker.vim
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

"Easier escape
ino jj <esc>
cno jj <c-c>

"Quick access to make
nnoremap <F10> :wa <ESC><BAR> :make -j4 DEBUG=1<CR>


"Recreate cscope db and reload it
"nnoremap <F9> :execute '!cscope -Rbq' <BAR> cs reset<CR>

"Quick access to Tagbar
nnoremap <F8> :TagbarToggle<CR>

"Quick access to buffer list
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F11> :YRShow<CR>

"Quick jump to alternate file
nnoremap <leader>a :A<CR>
nnoremap <leader>av :AV<CR>

"Quick difference from when file was opened
nnoremap <leader>do :DiffOrig<cr>
nnoremap <leader>dc :q<cr>:diffoff!<cr>

"Turns off Vim's crazy default regex characters and makes searches use normal
"regexes
nnoremap / /\v
vnoremap / /\v

"Bubble single lines
nnoremap <Up> [e
nnoremap <Down> ]e

"Bubble multiple lines
vnoremap <Up> [egv
vnoremap <Down> ]egv

"Quick open of .vimrc in a right vertical split
nnoremap <leader>erc <C-w>v<C-w>l:e $MYVIMRC<cr>

"Who cares using F1 to call for help??
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

"Providing :Hexmode ex command to toggle xxd hex mode on or off
"(http://vim.wikia.com/wiki/Improved_Hex_editing)
"see also http://vim.wikia.com/wiki/Hex_dump for more general usage of xxd
nnoremap <leader>h :Hexmode<CR>
inoremap <leader>h <Esc>:Hexmode<CR>
vnoremap <leader>h :<C-U>Hexmode<CR>

"let j and k work as you expect
nnoremap j gj
nnoremap k gk

"Helpers to open files in current file directory
noremap <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>

"Replace word under cursor with register
nnoremap S "_diwP

"To ease jumping around in windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

"Clear highlighted search
nnoremap <silent> <leader><space> :nohlsearch<CR>

"CD to path of file being edited
nnoremap <leader>cd :cd %:p:h<CR>

"Configure CSApprox
let g:CSApprox_attr_map = {'bold' : 'bold', 'italic' : '', 'sp' : '' }

"--------------------Setup up colorscheme stuff--------------------
if ! has ('gui_running')
    set t_Co=256
else
    set guifont=Inconsolata:h13
endif

let g:solarized_contrast="normal"
let g:solarized_visibility="high"
colorscheme solarized
"colorscheme ir_black
"colorscheme zenburn
set background=dark

"CursorLine settings for zenburn
"highlight CursorLine ctermbg=DarkYellow guibg=#ac801e

highlight CursorLine ctermbg=16 guibg=Black
highlight IncSearch ctermfg=4 ctermbg=DarkMagenta guibg=DarkMagenta
highlight Search ctermbg=DarkMagenta guibg=DarkMagenta
"-------------------------------------------------------------------

if has('statusline')
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
    set laststatus=2
endif

if has('cmdline_info')
	set ruler " show the ruler
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
	set showcmd " show partial commands in status line and
                " selected characters/lines in visual mode
endif

if has('gui_running')
	set guioptions-=T " remove the toolbar
    set lines=60 " 40 lines of text instead of 24,
    set columns=120
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"---------------------------- FROM LLVM VIMRC ---------------------------
" Highlight trailing whitespace and lines longer than 80 columns.
"highlight LongLine ctermbg=DarkYellow guibg=DarkYellow
"highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
"if v:version >= 702
"  " Lines longer than 80 columns.
"  " au BufWinEnter * let w:m0=matchadd('LongLine', '\%>80v.\+', -1)
"
"  " Whitespace at the end of a line. This little dance suppresses
"  " whitespace that has just been typed.
"  au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"  au InsertEnter * call matchdelete(w:m1)
"  au InsertEnter * let w:m2=matchadd('WhitespaceEOL', '\s\+\%#\@<!$', -1)
"  au InsertLeave * call matchdelete(w:m2)
"  au InsertLeave * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)
"else
"  " au BufRead,BufNewFile * syntax match LongLine /\%>80v.\+/
"  au InsertEnter * syntax match WhitespaceEOL /\s\+\%#\@<!$/
"  au InsertLeave * syntax match WhitespaceEOL /\s\+$/
"endif
" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
autocmd FileType make set noexpandtab
" Optional
" C/C++ programming helpers
augroup csrc
  au!
  autocmd FileType *      set nocindent smartindent
  autocmd FileType c,cpp  set cindent
augroup END
" Set a few indentation parameters. See the VIM help for cinoptions-values for
" details.  These aren't absolute rules; they're just an approximation of
" common style in LLVM source.
set cinoptions=:0,g0,(0,Ws,l1

augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
    au! BufRead,BufNewFile *.td     set filetype=tablegen
    au! BufRead,BufNewFile *Makefile*     set filetype=make
augroup END
"-------------------------------------------------------------------

"------------------ ECLIM            -------------------------------
let g:EclimCSearchSingleResult='edit' "'split', 'edit' or 'lopen'
"let g:EclimProjectStatusLine
let g:EclimCValidate=0 "Use :Validate to manually validate
let g:EclimValidateSortResults='severity' "'occurrence'
let g:EclimLocationListHeight=10
nnoremap <silent> <cr> :CSearchContext<cr>
" Restore original <cr> behavior in quickfix window to have enter work as
" expected there
autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>

"-------------------------------------------------------------------

"------------------ IntelligentTags  -------------------------------
let g:Itags_dir_name='expand(''~/tags/'') . fnamemodify( dirName . ''/'' . fName, '':gs?[/\\:\.]\+?\.?'')'
let g:Itags_Ctags_Flags="-n --extra=+q -R --languages=C,C++ --c++-kinds=+plx --fields=+iaS --sort=foldcase -I'__THROW,__NTH+,__wur,__warnattr, __nonnull, __attribute_malloc__, __attribute_pure__,             __attribute_used__, __attribute_noinline__, __attribute_deprecated__, __attribute_format_arg__, __attribute_format_strfmon__, __attribute_warn_unused_result__, __always_inline,         __extern_inline, __extension__, __restrict'"
let g:Itags_Depth=-1


"------------------ OMNICPP COMPLETE -------------------------------
"let OmniCpp_NamespaceSearch=1
"let OmniCpp_GlobalScopeSearch=1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 0 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
""let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"let OmniCpp_ShowScopeInAbbr = 1
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"-------------------------------------------------------------------

"------------------------ SINGLE COMPILE ---------------------------
 call SingleCompile#SetCompilerTemplate('cpp', 'g++',
             \'g++ self-built', '$GCCROOT/bin/g++', '-g3 -std=c++11 -D_GLIBCXX_USE_NANOSLEEP -Wall -fno-pie -Wl,-no_pie -I$HOME/include -I$BOOSTROOT/include -L$BOOSTROOT/darwin-fsfgcc/static/lib -lboost_all -o %:r', './%:r')

 call SingleCompile#SetCompilerTemplate('cpp', 'clang++_libc++',
             \'clang++ self-built with libcxx', '$LLVMROOT/bin/clang++', '-g3 -std=c++11 -stdlib=libc++ -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-undef -fno-pie -Wl,-no_pie -I$HOME/include -I$BOOSTROOT/include -I$LIBCXXROOT/include -L$LIBCXXROOT/lib -L$BOOSTROOT/clang-xcode/static/lib -lboost_all -o %:r', './%:r')


if has('mac')
    call SingleCompile#ChooseCompiler ('cpp','clang++_libc++')
elseif ! s:uname == "SunOS"
    call SingleCompile#ChooseCompiler ('cpp','g++')
endif
"-------------------------------------------------------------------

"------------------ CLANG COMPLETE -------------------------------
if has('mac')
    let g:clang_exec = system("xcrun -f clang++")
    let g:clang_user_options = '-stdlib=libc++ -std=c++11 -I' . $BOOSTROOT . '/include'
    "let g:clang_user_options="-std=c++11 -stdlib=libc++ -I" . $BOOSTROOT . "/include -I" . $LIBCXXROOT . "/include" 
    let xcode_in_use = split(system ("xcode-select --print-path"), "\n")
    let g:clang_library_path = xcode_in_use[0] . "/Toolchains/XcodeDefault.xctoolchain/usr/lib"
else
    let g:clang_exec = $LLVMROOT . "/bin/clang++"
    let g:clang_user_options = '-std=c++11 -I' . $BOOSTROOT . '/include'
    let g:clang_library_path = $LLVMROOT . "/lib"
endif

let g:clang_complete_auto = 0
let g:clang_auto_select = 1
let g:clang_use_library = 1
let g:clang_complete_patterns = 1
let g:clang_complete_copen = 0
let g:clang_hl_errors = 1
"New additions for CLIC
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete' "'ultisnips'
let g:clang_conceal_snippets = 1
let g:clang_auto_user_options = "path, .clang_complete"
let g:clang_sort_algo = "alpha"
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 0
let g:clang_debug = 0  "Set to 1 and type :mess after completion to see the exact cmdline flags
let g:clang_close_preview = 1
let g:clang_jumpto_declaration_key = "<C-_>"
"let g:clang_trailing_placeholder=1
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
"let g:clic_filename="/Users/abigagli/develop/commprove/H3G/GTPAnalyzerMT/prj-index/index.db"
"-----------------------------------------------------------------


"------------------ SUPERTAB -------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"

"-------------- Gtags --------------
":map <C-]> :Gtags<CR><CR>
:map <C-\> :Gtags -r<CR><CR>


"-------------- Alternate --------------
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"
let g:alternateExtensions_h = "m,mm,c,cpp,cc,cxx"

"-------------------- TASKLIST ------------------------------------
"tasklist remapped to <Leader>v to avoid conflict with commandT
map <leader>v <Plug>TaskList
let g:tlTokenList = ['TODO', 'FIXME']

"------------- Grep  ------------------
let Grep_Xargs_Options = '-0'
let Grep_Default_Filelist = '*.c *.cpp *.h *.hpp'


"------------- Tabularize  ------------------
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a{ :Tabularize /{<CR>
vnoremap <leader>a{ :Tabularize /{<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>


"-------------- Functions ----------------

function! s:windowdir()
  if winbufnr(0) == -1
    return getcwd()
  endif
  return fnamemodify(bufname(winbufnr(0)), ':p:h')
endfunc

function! s:Find_in_parent(fln,flsrt,flstp)
  let here = a:flsrt
  while ( strlen( here) > 0 )
    if filereadable( here . "/" . a:fln )
      return here
    endif
    let fr = match(here, "/[^/]*$")
    if fr == -1
      break
    endif
    let here = strpart(here, 0, fr)
    if here == a:flstp
      break
    endif
  endwhile
  return "Nothing"
endfunc

"let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),"/")
"    echo "Found cscope.out at: " . newcsdbpath
"    "echo "Windowdir: " . s:windowdir()
"if newcsdbpath != "Nothing"
"    if !cscope_connection(3, "out", newcsdbpath)
"        exe "cs add " . newcsdbpath  . "/cscope.out " . newcsdbpath
"    endif
"else
"    echo "cscope not found"
"endif

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
        cclose
    else
        execute "botright copen"
    endif
endfunction

" Used to track the quickfix window.
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

" Use viminfo to restore cursor position over editing sessions
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END



" '\g' : grep all open buffers
noremap <Leader>g <Esc>:GrepBuffer <CR>

" '\gg' : grep all open buffers for word under cursor
noremap <Leader>gg <Esc>:GrepBuffer <C-R><C-W><CR>

" '\G' : recursively grep through filesystem
noremap <Leader>G <Esc>:Rgrep<CR>

" '\qq' : toggle QuickFix window (errors and vimgrep results here)
noremap <silent><leader>qq <Esc>:call QFixToggle(0)<CR>

" '[q' previous quickfix entry
noremap [q :cprev<CR>

" ']q' next quickfix entry
noremap ]q :cnext<CR>

" '\q*' : search for occurrences of word under cursor, and write to QuickFix
noremap <silent><leader>q*  <Esc>:execute 'vimgrep '.expand('<cword>').' '.expand('%') <CR> :copen <CR> :cc


" Make various lists of C/C++ functions
"  \p? prototypes : \[px]g: globals   \pc: comment   \pp: all prototypes
"  \x? externs    : \[px]s: statics                  \xx: all externs
"map <Leader>pc   :w<CR>:!${CECCMD}/flist -c  % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>pg   :w<CR>:!${CECCMD}/flist -pg % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>pp   :w<CR>:!${CECCMD}/flist -p  % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>ps   :w<CR>:!${CECCMD}/flist -ps % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>xg   :w<CR>:!${CECCMD}/flist -xg % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>xs   :w<CR>:!${CECCMD}/flist -xs % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>
"map <Leader>xx   :w<CR>:!${CECCMD}/flist -x  % >tmp.vim<CR>:r tmp.vim<CR>:!rm tmp.vim<CR>

" ex command for toggling hex mode - define mapping if desired
command! -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction


" CLANG-CHECK (from http://clang.llvm.org/docs/HowToSetupToolingForLLVM.html)

function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F5> :call ClangCheck()<CR><CR>



" Searches Dash for the word under your cursor in vim, using the keyword 
" operator, based on file type. E.g. for JavaScript files, I have it 
" configured to search j:term, which immediately brings up the JS doc
" for that keyword. Might need some customisation for your own keywords!
 
function! SearchDash()
  " Some setup
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
 
  " Get the filetype (everything after the first ., for special cases
  " such as index.html.haml or abc.css.scss.erb)
  let s:fileType = substitute(expand("%"),"^[^.]*\.","",1)
 
  " Alternative ways of getting filetype, aborted
  " let s:fileType = expand("%:e")
  " let s:searchType = b:current_syntax.":"
 
  " Match it and set the searchType -- make sure these are the right shortcuts
  " in Dash! Sort by priority in the match list below if necessary, because
  " Tilt-enabled projects may have endings like .scss.erb. 
  if match(s:fileType, "js") != -1
    let s:searchType = "js:"     " can assign this to jQuery, too
  elseif match(s:fileType, "css") != -1
    let s:searchType = "css:"
  elseif match(s:fileType, "html") != -1
    let s:searchType = "html:"
  elseif match(s:fileType, "rb") != -1
    let s:searchType = "rb:"    " can assign this to Rails, too
  elseif match(s:fileType, "php") != -1
    let s:searchType = "php:"
  elseif match(s:fileType, "py") != -1
    let s:searchType = "python:"
  else
    let s:searchType = ""
  endif
 
  " Run it
  let s:url = "dash://".s:searchType.s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR>
