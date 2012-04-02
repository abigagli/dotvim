set nocompatible
filetype off 

"Activate vundle and let it manage itself
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"And now all the bundles I want to use
"-------------------------------------------------------
Bundle 'git://github.com/vim-scripts/TaskList.vim'
Bundle 'git://github.com/vim-scripts/Tagbar'
Bundle 'git://github.com/vim-scripts/Intelligent-Tags'
Bundle 'git://github.com/vim-scripts/PreciseJump'
Bundle 'git://github.com/vim-scripts/errormarker.vim'
Bundle 'git://github.com/vim-scripts/clang-complete'
Bundle 'git://github.com/vim-scripts/unimpaired.vim'
Bundle 'git://github.com/vim-scripts/YankRing.vim'
Bundle 'git://github.com/vim-scripts/ack.vim'
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter'
Bundle 'git://github.com/vim-scripts/SuperTab-continued.'
Bundle 'git://github.com/vim-scripts/Screen-vim---gnu-screentmux'
Bundle 'git://github.com/vim-scripts/surround.vim'
Bundle 'git://github.com/vim-scripts/toggle_mouse'
Bundle 'git://github.com/vim-scripts/grep.vim'
Bundle 'git://github.com/vim-scripts/snipMate'
Bundle 'git://github.com/vim-scripts/bufexplorer.zip'
Bundle 'git://github.com/vim-scripts/a.vim'
Bundle 'git://github.com/vim-scripts/SingleCompile'
Bundle 'git://github.com/vim-scripts/The-NERD-tree'
Bundle 'git://github.com/vim-scripts/ctrlp.vim'
Bundle 'git://github.com/vim-scripts/cscope_macros.vim'
Bundle 'git://github.com/vim-scripts/fugitive.vim'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-clang'
"Bundle 'Lokaltog/vim-easymotion'
"-------------------------------------------------------


"ctrlp search by filename (not full path)
let g:ctrlp_by_filename = 1

syntax on
filetype plugin indent on

"source $VIMRUNTIME/vimrc_example.vim
set tags=./tags; "quantiqa-* 
set path+=./x64-Darwin/include;quantiqa-*
set path+=./3rdParty/cal/x64-Darwin/include;quantiqa-*
set path+=$GCCROOT/include/**
set path+=$BOOSTROOT/include

"Disable cmake-indent which apparently screws up c/c++ indenting
let b:did_indent = 1

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
set wildignore+=*.a,*.o,*.so,*.dylib,*.gz,*.tar,.DS_Store
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

let mapleader=","


"Invoke ctrlp as if it was command-t
let g:ctrlp_map = '<leader>t'

"Hit F to follow log file
nmap F :e<CR>GL:sleep 1<CR>F

"easier use of cscope_map which is based on C-\
nmap <C-_> <C-\>


"distinguish errors from warnings in errormarker.vim
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

"Easier escape
ino jj <esc>
cno jj <c-c>

"Quick access to make
nmap <F10> :wa <ESC><BAR> :make DEBUG=1<CR>


"Recreate cscope db and reload it
nmap <F9> :execute '!cscope -Rbq' <BAR> cs reset<CR>

"Quick access to Tagbar
nmap <F8> :TagbarToggle<CR>

"Quick access to buffer list
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F11> :YRShow<CR>

"Quick jump to alternate file
nmap <leader>a :A<CR>
nmap <leader>av :AV<CR>

"Quick difference from when file was opened
nmap <leader>do :DiffOrig<cr>
nmap <leader>dc :q<cr>:diffoff!<cr>

"Turns off Vim's crazy default regex characters and makes searches use normal
"regexes
nnoremap / /\v
vnoremap / /\v

"Bubble single lines
nmap <Up> [e
nmap <Down> ]e

"Bubble multiple lines
vmap <Up> [egv
vmap <Down> ]egv

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
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>

"Replace word under cursor with register
nnoremap S "_diwP

"To ease jumping around in windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"Clear highlighted search
nmap <silent> <leader><space> :nohlsearch<CR>

"CD to path of file being edited
nmap <leader>cd :cd %:p:h<CR>


if ! has ('gui_running')
    set t_Co=256
    colorscheme ir_black
    "highlight CursorLine ctermbg=darkblue
else
    colorscheme ir_black
    colorscheme macvim
    set guifont=Inconsolata:h14
    "highlight CursorLine guibg=darkblue 
endif

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
let g:EclimCSearchSingleResult='lopen' "'split', 'edit' or 'lopen'
"let g:EclimProjectStatusLine
"-------------------------------------------------------------------

"------------------ IntelligentTags  -------------------------------
let g:Itags_dir_name=' ''/Volumes/develop/tags/'' . fnamemodify( dirName . ''/'' . fName, '':gs?[/\\:\.]\+?\.?'')'
let g:Itags_Ctags_Flags="-n --extra=+q -R --languages=C,C++ --c++-kinds=+plx --fields=+iaS --sort=foldcase -I'__THROW,__NTH+,__wur,__warnattr, __nonnull, __attribute_malloc__, __attribute_pure__,             __attribute_used__, __attribute_noinline__, __attribute_deprecated__, __attribute_format_arg__, __attribute_format_strfmon__, __attribute_warn_unused_result__, __always_inline,         __extern_inline, __extension__, __restrict'"


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
             \'g++ self-built', '/Users/abigagli/GCC-CURRENT/bin/g++', '-g3 -std=c++0x -Wall -fno-pie -Wl,-no_pie -Wl,-rpath,$BOOSTROOT/MacOS/lib -I$BOOSTROOT/include -L$BOOSTROOT/MacOS/lib -lboost_thread -lboost_date_time -lboost_system -o %:r', './%:r')

 call SingleCompile#SetCompilerTemplate('cpp', 'clang++',
             \'clang++ self-built with libcxx', '/Users/abigagli/LLVM-CURRENT/bin/clang++', '-g3 -std=c++11 -stdlib=libc++ -Wl,-no_pie -Wl,-rpath,$BOOSTROOT/MacOS/lib -I$BOOSTROOT/include -I$LIBCXXROOT/include -L$LIBCXXROOT/lib -L$BOOSTROOT/MacOS/lib -lboost_date_time -lboost_system -o %:r', './%:r')

call SingleCompile#ChooseCompiler ('cpp','clang++')
"call SingleCompile#ChooseCompiler ('cpp','g++')
"-------------------------------------------------------------------

"------------------ CLANG COMPLETE -------------------------------
let g:clang_exec = "/Users/abigagli/LLVM-CURRENT/bin/clang++"
let g:clang_user_options="-std=c++0x -stdlib=libc++ -I$BOOSTROOT/include -I/Users/abigagli/develop/LLVM_FACTORY/LIBCXX/include"
let g:clang_complete_auto = 0
let g:clang_auto_select = 1
let g:clang_use_library = 1
let g:clang_library_path = "/Users/abigagli/LLVM-CURRENT/lib"
let g:clang_complete_patterns = 1
let g:clang_complete_copen = 1
let g:clang_hl_errors = 1
"New additions for CLIC
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
"let g:clang_debug=1
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
"let g:clic_filename="/Users/abigagli/develop/commprove/H3G/GTPAnalyzerMT/prj-index/index.db"

"-----------------------------------------------------------------


"------------------ SUPERTAB -------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"



"-------------- Alternate --------------
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"
let g:alternateExtensions_h = "m,mm,c,cpp,cc,cxx"

"-------------------- TASKLIST ------------------------------------
"tasklist remapped to <Leader>v to avoid conflict with commandT
map <leader>v <Plug>TaskList
let g:tlTokenList = ['TODO', 'FIXME']


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

let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),"/")
    echo "Found cscope.out at: " . newcsdbpath
    "echo "Windowdir: " . s:windowdir()
if newcsdbpath != "Nothing"
    if !cscope_connection(3, "out", newcsdbpath)
        exe "cs add " . newcsdbpath  . "/cscope.out " . newcsdbpath
    endif
else
    echo "cscope not found"
endif

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


"------------- Grep  ------------------
let Grep_Xargs_Options = '-0'
let Grep_Default_Filelist = '*.c *.cpp *.h *.hpp'

" '\g' : grep all open buffers
noremap <Leader>g <Esc>:GrepBuffer <CR>

" '\gg' : grep all open buffers for word under cursor
noremap <Leader>gg <Esc>:GrepBuffer <C-R><C-W><CR>

" '\G' : recursively grep through filesystem
noremap <Leader>G <Esc>:Rgrep<CR>

" '\qq' : toggle QuickFix window (errors and vimgrep results here)
noremap <silent><leader>qq <Esc>:call QFixToggle(0)<CR>

" '[q' previous quickfix entry
map [q :cprev<CR>

" ']q' next quickfix entry
map ]q :cnext<CR>

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
