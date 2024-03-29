" MINIMAL BARE BONES NAVIGATION AS SEEN IN https://vimeo.com/65250028
" :find
" set path=**;.git
" set suffixesadd=.cpp,.hpp,.h
" set nocompatible
" set wildmode=full
" set wildmenu
" set wildignore=*.o,*.a,*.so
" :ls & :<number>[s]b
" :Explore
" :e scp://host/some/where/to/file.txt

set nocompatible

" Workaround for garbage characters when using iterm2
" see https://stackoverflow.com/questions/21618614/vim-shows-garbage-characters
set t_RV=
let s:uname = system ("uname")

"These must be done before ALE gets loaded
let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1
"""""""""""""""""""""

" cgrep config =======================
if s:uname == "Linux\n"
    set grepprg=cgrep
endif



if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"Force python version used by vim to be python
"see https://robertbasic.com/blog/force-python-version-in-vim/
if has ('python3')
endif

" VIM-PLUG
"-------------------------------------------------------
call plug#begin('~/.vim/bundle')
Plug 'embear/vim-localvimrc'

Plug 'https://github.com/vim-scripts/TaskList.vim'
Plug 'https://github.com/vim-scripts/Tagbar'
Plug 'https://github.com/vim-scripts/errormarker.vim'
Plug 'https://github.com/vim-scripts/unimpaired.vim'
"Plug 'https://github.com/vim-scripts/YankRing.vim'
Plug 'https://github.com/vim-scripts/The-NERD-Commenter'
"Plug 'https://github.com/vim-scripts/Screen-vim---gnu-screentmux'
Plug 'https://github.com/vim-scripts/surround.vim'
"Plug 'https://github.com/vim-scripts/toggle_mouse'
Plug 'https://github.com/vim-scripts/grep.vim'
Plug 'https://github.com/vim-scripts/bufexplorer.zip'
"Plug 'https://github.com/vim-scripts/a.vim'
Plug 'https://github.com/vim-scripts/SingleCompile'
Plug 'https://github.com/vim-scripts/The-NERD-tree', {'on': 'NERDTreeToggle'}
"Plug 'https://github.com/vim-scripts/cscope_macros.vim'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/vim-scripts/Lucius'
Plug 'https://github.com/vim-scripts/bash-support.vim'
Plug 'https://github.com/vim-scripts/git-file.vim'
Plug 'https://github.com/vim-scripts/gtags.vim'
Plug 'https://github.com/vim-scripts/listmaps.vim'
"Plug 'https://github.com/vim-scripts/Conque-GDB'


if has ('python3')
    "Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
endif

Plug 'gregsexton/gitv'
"Plug 'jnurmine/Zenburn'
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'proyvind/Cpp11-Syntax-Support'
"Plug 'altercation/vim-colors-solarized'
Plug 'sjl/clam.vim'
"Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
"Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
"Plug 'supasorn/vim-easymotion'
"Plug 'nelstrom/vim-qargs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'dahu/LearnVim'
"Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
"Plug 'jalcine/cmake.vim'

Plug 'airblade/vim-gitgutter'

"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
"Plug 'Raimondi/delimitMate'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'xolox/vim-session'
"Plug 'wesleyche/SrcExpl'
"Plug 'wesleyche/Trinity'
Plug 'tpope/vim-repeat'
Plug 'lightxue/SwissCalc'
if has('mac')
    "Plug 'gilligan/vim-lldb'
endif
Plug 'tpope/vim-dispatch'
Plug 'Wolfy87/vim-enmasse'
Plug 'tommcdo/vim-exchange'
if has('mac')
    Plug 'rizzatti/dash.vim'
endif
"Plug 'tpope/vim-sensible'
Plug 'pelodelfuego/vim-swoop'
"Plug 'fcpg/vim-fahrenheit'
"Plug 'CoatiSoftware/vim-sourcetrail'
Plug 'alessandroyorba/sierra'
Plug 'cocopon/iceberg.vim'
Plug 'dawikur/algorithm-mnemonics.vim'
"Plug 'lyuts/vim-rtags'
Plug 'christoomey/vim-system-copy'
"Plug 'mileszs/ack.vim'
Plug 'vim-scripts/ag.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lifepillar/vim-cheat40'
Plug 'thiagoalessio/rainbow_levels.vim'

"Plug 'jaxbot/semantic-highlight.vim'
Plug 'rhysd/vim-clang-format'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'chrisbra/unicode.vim'
Plug 'unblevable/quick-scope'

call plug#end()
"-------------------------------------------------------

set tags=./tags,./.tags; "quantiqa-*
"set path+=./$HOST_TUPLE/include;quantiqa-*
"set path+=./3rdParty/cal/$HOST_TUPLE/include;quantiqa-*
set path=.,/usr/include/**,,
set path+=$GCCROOT/include/c++/**
set path+=$BOOSTROOT/include/**
set path+=$LLVMROOT/include/**

"let mapleader="\<space>"
let mapleader=","

"--------------------Setup up colorscheme stuff--------------------
if ! has ('gui_running')
    set t_Co=256
else
    set guifont=JetBrainsMono-Regular:h11
endif

colorscheme iceberg
"colorscheme fahrenheit
"colorscheme solarized
"colorscheme ir_black
"colorscheme zenburn
set background=dark

" quick-scope
augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T' ]

" clang_format: format-on-save
let g:clang_format#auto_format=1

"-------------------- Prepare for COC --------------------
if has ('gui_running')
    let g:coc_node_path = '/opt/local/bin/node'
endif

let g:coc_global_extensions = [
    \ 'coc-yank',
    \ 'coc-snippets',
    \ 'coc-lists',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-cmake',
    \ 'coc-clangd',
    \ ]

" ************ NOTE (https://github.com/clangd/clangd/issues/487) **********
" Workaround for 'System headers not found on macOS if compiler invoked as /usr/bin/clang++'
" (https://github.com/clangd/clangd/issues/487)
" If using /usr/bin/clang++ and coc seems not to be working, try adding
" "clangd.arguments": ["--query-driver=/usr/bin/clang++"]
" to ~/.vim/coc-settings.json
" **************************************************************************

" ------------------------------------ Suggested settings for coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Remap CTRL-+ to CTRL-] to allow easy tag navigation
" with italian keyboard
nnoremap <c-+> <c-]>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Coc-extensions settings
" ------------------ coc-yank
nnoremap <silent> <leader>a  :<C-u>CocCommand clangd.switchSourceHeader<cr>

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
"nnoremap <silent> <space>yr  :<C-u>CocCommand yank.clean<cr>
hi HighlightedyankRegion term=bold ctermbg=LightYellow guibg=#13354A
hi CocHighlightText term=bold ctermbg=LightGrey guibg=#13354A

" ------------------ coc-snippets
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)
"-----------------------------------------------------------

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set mouse=a
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cursorline
set wildchar=<Tab>
set wildmenu
set wildmode=list:longest
set wildignore+=*.a,*.o,*.so,*.dylib,*.gz,*.tar,.DS_Store,*/.hg/*,*/.svn/*
set scrolloff=3
set makeprg=make
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
set mps+=<:>
set directory=/var/tmp,/tmp

"NOT SURE THIS IS RELEVANT ANYMORE, FOR NOW JUST FORCE clipboard=unnamedplus
"WHICH SEEMS TO BE WORKING FINE FOR SHARING CLIPBOARD ACROSS OSX/LINUX
"if $TMUX == ""
"    "When running in tmux and reattaching to an old session that is running
"    "a shell that has an outdated value of DISPLAY value, having "unnamed" in
"    "the clipboard options causes an "E353: Nothing in register *" at every 
"    "attempt to paste. (see "http://stackoverflow.com/questions/11404800/fix-vim-tmux-yank-paste-on-unnamed-register).
"    "Simplest workaround is to add "unnamed" to clipboard options only when
"    "_NOT_ running under tmux
"    set clipboard+=unnamed
"endif
set clipboard=unnamed
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

set exrc

set virtualedit=block

if has ('persistent_undo')
    set undofile
    set undodir=$HOME/tmp/VIM_UNDO_FILES
endif


"Instead of disabling esckeys to remove the pause i.e. when doing esc-O in
"insert mode, just use a much shorter timeout for key-codes setting ttimeoutlen
"see http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
"and :h esckeys
"set noesckeys
set ttimeoutlen=100

if has ('conceal')
    set concealcursor=inv
    set conceallevel=2
endif


au BufNewFile,BufRead *.cpp set syntax=cpp11

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"VIMCAST"""""""""""""""""""""""""""""""""""""
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

"a mapping to perform calculations
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>"

""""""""""""""""""""""""""""""""""""""""""""""
"Easily select pasted text
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

"Some nifty tricks from Instantly-better-vim (Damian Conway, OSCON 2012/2013)
"nnoremap <SPACE> <PAGEDOWN>
runtime plugin/dragvisuals.vim

vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  D        DVB_Duplicate()



"Disable cmake-indent which apparently screws up c/c++ indenting
let b:did_indent = 1


"Always put quickfix window at the bottom of the window layout
"autocmd FileType qf wincmd J DISABLED as it seems to cause problems with YCM's quickfix and location list handling

"Should let vim realize the file was externally changed
autocmd Cursorhold * checktime

"Powerline ------------------------
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

"yankring ------------------------
"let g:yankring_manual_clipboard_check=1


"cmake.vim -----------------------
let g:cmake_set_makeprg = 0

"fzf ----------------------------
let g:fzf_layout = { 'down': '~40%' }
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nnoremap <leader>F :Files<CR>
nnoremap <leader>B :Buffers<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"ctrlp ----------------------------
"let g:ctrlp_by_filename = 1
"let g:ctrlp_map = '<leader>t'
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_root_markers = ['Version.make']
"let g:ctrlp_user_command = 'find %s -type f'

"easytags -------------------------------
"let g:easytags_updatetime_warn = 0
"let g:easytags_autorecurse = 1
"let g:easytags_include_members = 1
"let g:easytags_dynamic_files = 1
"let g:easytags_on_cursorhold = 0
"let g:easytags_auto_update = 0
"let g:easytags_auto_highlight = 0

"Using g:easytags_events to automatically update/highlight (depending on
"g:easytags_auto_update/g:easytags_auto_highlight) tags for the current file
"right after you save the file. NOTE: THIS CAUSES
"g:easytags_always_enabled/g:easytags_on_cursorhold to be completely ignored
"let g:easytags_events = ['BufWritePost']
highlight link cMember Special

"Dash
if has('mac')
    nmap <silent> <leader>D <Plug>DashSearch
endif

"EasyMotion ------------------------------
"let g:EasyMotion_leader_key = '<SPACE>'

"Hit F to follow log file
nmap <leader>_ :e<CR>GL:sleep 1<CR><leader>_

"easier use of cscope_map which is based on C-\
nmap <C-_> <C-\>

"easy buffer navigation
nnoremap <leader>l :ls<CR>:b<space>

"distinguish errors from warnings in errormarker.vim
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

"Easier escape
inoremap jk <esc>
cnoremap jk <c-c>

"Quick access to make
nnoremap <F10> :wa <ESC><BAR> :Make -C BUILD_DEBUG -j24<CR>


"Recreate cscope db and reload it
"nnoremap <F9> :execute '!cscope -Rbq' <BAR> cs reset<CR>

"Quick access to Tagbar
nnoremap <F8> :TagbarToggle<CR>

"Quick access to buffer list
"nnoremap <F5> :buffers<CR>:buffer<Space>

"Quick jump to alternate file
"nnoremap <leader>a :A<CR>
"nnoremap <leader>av :AV<CR>

"Quick difference from when file was opened
nnoremap <leader>do :DiffOrig<cr>
nnoremap <leader>dc :q<cr>:diffoff!<cr>

if !has('mac') "Disabled on mac since this causes ALL buffer to be highlighted when starting the search
"Turns off Vim's crazy default regex characters and makes searches use normal regexes
    nnoremap / /\v
    vnoremap / /\v
    cmap s/ s/\v
endif

"Bubble single lines
nmap <UP> [e
nmap <DOWN> ]e

"Bubble multiple lines
"vmap <UP> [egv
"vmap <DOWN> ]egv

"Quick open of .vimrc in a right vertical split
nnoremap <leader>erc <C-w>v<C-w>l:e $MYVIMRC<cr>


"Providing :Hexmode ex command to toggle xxd hex mode on or off
"(http://vim.wikia.com/wiki/Improved_Hex_editing)
"see also http://vim.wikia.com/wiki/Hex_dump for more general usage of xxd
nnoremap <leader>h :Hexmode<CR>
"inoremap <leader>h <Esc>:Hexmode<CR>
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
"DISABLED TO AVOID PROBLEMS WITH vim-tmux-navigator
"nnoremap <C-H> <C-W>h
"nnoremap <C-J> <C-W>j
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l

"Clear highlighted search
nnoremap <silent> <leader><space> :nohlsearch<CR>

"CD to path of file being edited
nnoremap <leader>cd :cd %:p:h<CR>

"Configure CSApprox
let g:CSApprox_attr_map = {'bold' : 'bold', 'italic' : '', 'sp' : '' }


" Highlight trailing whitespace as per http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
autocmd Syntax * syn match WhitespaceEOL /\s\+$\| \+\ze\t/

"CursorLine settings for zenburn
"highlight CursorLine ctermbg=DarkYellow guibg=#ac801e

highlight CursorLine ctermbg=16 guibg=Black
highlight IncSearch ctermfg=4 ctermbg=DarkMagenta guibg=DarkMagenta
highlight Search ctermbg=DarkMagenta guibg=DarkMagenta

"with these you can get iTerm to render a background image
"highlight Normal ctermbg=NONE
"highlight NonText ctermbg=NONE

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
"---------------------------- VIM-SESSION ---------------------------
let g:session_autoload='prompt'
let g:session_autosave='prompt'
let g:session_autosave_periodic=60

"---------------------------- EASYCLIP ---------------------------
"let g:EasyClipAutoFormat = 1


"---------------------------- ALE  ---------------------------
nmap<silent><leader>k <Plug>(ale_previous_wrap)
nmap<silent><leader>j <Plug>(ale_next_wrap)
nmap<silent><leader>i :ALEDetail<CR>

let g:ale_cpp_cc_options = '-std=c++20 -Wall'
let g:ale_cpp_clangtidy_options = '-std=c++20 -isystem ' . $BOOSTROOT . '/include'

if has('mac')
    "Set this if you use 'clang' as a linter to ensure which version of clang to use
    let g:ale_cpp_cc_executable = $HOME . '/LLVM-CURRENT/bin/clang++'
    let g:ale_cpp_clangtidy_executable = $HOME . '/LLVM-CURRENT/bin/clang-tidy'
    "let g:ale_cpp_cc_options .= ' -isysroot ' . system("xcrun --show-sdk-path")
    let g:ale_linters = {
                \ 'c': ['clang', 'clangtidy'],
                \ 'cpp': ['clang', 'clangtidy'],
                \}
endif

if has('linux')
    let g:ale_cpp_cc_executable='/usr/local/bin/latest-g++'
    let g:ale_linters = {
                \ 'c': ['gcc', 'clangtidy'],
                \ 'cpp': ['g++', 'clangtidy'],
                \}
endif

let g:ale_fixers = {
            \ 'c': ['clang-format'],
            \ 'cpp': ['clang-format'],
            \}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_c_parse_compile_commands = 1

"NOTE:Once you explicitly set g:ale_cpp_clangtidy_options, you have to set
"g:ale_c_build_dir or g:ale_c_build_dir_names to re-enable using
"compile_commands.json
let g:ale_cpp_clangtidy_checks = ['*', '-fuchsia*', '-*array*decay', '-*braces-around-statements', '-llvm*', '-readability-implicit-bool-conversion', '-*avoid-c-arrays']
"let g:ale_cpp_clangtidy_options = '-std=c++17'

"Couldn't seem to make these work...
"let g:airline#extensions#ale#enabled = 1
"set statusline+=%{ALEGetStatusLine()}
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

"---------------------------- SURFER ---------------------------
let g:surfer_root_markers = [ 'Version.make' ]


""------------------ ECLIM            -------------------------------
"let g:EclimCSearchSingleResult='edit' "'split', 'edit' or 'lopen'
""let g:EclimProjectStatusLine
"let g:EclimCValidate=0 "Use :Validate to manually validate
"let g:EclimValidateSortResults='severity' "'occurrence'
"let g:EclimLocationListHeight=10
"nnoremap <silent> <cr> :CSearchContext<cr>
"" Restore original <cr> behavior in quickfix window to have enter work as
"" expected there
"autocmd BufReadPost quickfix nnoremap <buffer> <cr> <cr>

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
             \'g++', 'g++', '-g3 -std=c++17 -Wall -I$HOME/include -o %:r', './%:r')

if has('mac')
    "silent let s:clang_exe = systemlist ('xcrun -f clang++')[0] "use systemlist as it appears to be automatically stripping the unwanted newline
    silent let s:clang_exe = '$HOME/LLVM-CURRENT/bin/clang++'
    silent let s:sdk_path = systemlist("xcrun --show-sdk-path")[0]
    silent let s:args = '-ggdb3 -O0 -std=c++20 -fsanitize=address,undefined -stdlib=libc++ -isysroot ' . s:sdk_path . ' -Weverything -Wno-padded -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-undef -fno-pie -Wl,-no_pie -I$HOME/include -I$BOOSTROOT/include -L$HOME/lib -L$HOME/LLVM-CURRENT/lib -L$BOOSTROOT/lib -Wl,-rpath,$HOME/lib -Wl,-rpath,$HOME/LLVM-CURRENT/lib -Wl,-rpath,$BOOSTROOT/lib -o %:r'

call SingleCompile#SetCompilerTemplate('cpp', 'clang++_libc++',
             \'clang++ release with libc++', s:clang_exe, s:args, './%:r')
endif


if has('mac')
    call SingleCompile#ChooseCompiler ('cpp','clang++_libc++')
else
    call SingleCompile#ChooseCompiler ('cpp','g++')
endif
"-------------------------------------------------------------------

"------------------ CLANG COMPLETE -------------------------------
"if has('mac')
"    let g:clang_exec = system("xcrun -f clang++")
"    let g:clang_user_options = '-stdlib=libc++ -std=c++11 -I' . $BOOSTROOT . '/include'
"    "let g:clang_user_options="-std=c++11 -stdlib=libc++ -I" . $BOOSTROOT . "/include -I" . $LIBCXXROOT . "/include"
"    let xcode_in_use = split(system ("xcode-select --print-path"), "\n")
"    let g:clang_library_path = xcode_in_use[0] . "/Toolchains/XcodeDefault.xctoolchain/usr/lib"
"else
"    let g:clang_exec = $LLVMROOT . "/bin/clang++"
"    let g:clang_user_options = '-std=c++11 -I' . $BOOSTROOT . '/include'
"    let g:clang_library_path = $LLVMROOT . "/lib"
"endif
"
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 1
"let g:clang_use_library = 1
"let g:clang_complete_patterns = 1
"let g:clang_complete_copen = 0
"let g:clang_hl_errors = 1
""New additions for CLIC
"let g:clang_snippets = 1
"let g:clang_snippets_engine =  'ultisnips' "'clang_complete'
"let g:clang_conceal_snippets = 1
"let g:clang_auto_user_options = "path, .clang_complete, compile_commands.json"
""let g:clang_compilation_database =
"let g:clang_sort_algo = "alpha"
"let g:clang_complete_macros = 1
"let g:clang_complete_patterns = 0
"let g:clang_debug = 0  "Set to 1 and type :mess after completion to see the exact cmdline flags
"let g:clang_close_preview = 1
"let g:clang_jumpto_declaration_key = "<C-_>"
""let g:clang_trailing_placeholder=1
"nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
"let g:clic_filename="/Users/abigagli/develop/commprove/H3G/GTPAnalyzerMT/prj-index/index.db"
"-----------------------------------------------------------------


"------------------ SUPERTAB -------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"

"-------------- Alternate --------------
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h"
let g:alternateExtensions_h = "m,mm,c,cpp,cc,cxx,CC"
let g:alternateNoDefaultAlternate = 1

"-------------------- TASKLIST ------------------------------------
"tasklist remapped to <Leader>v to avoid conflict with commandT
map <leader>v <Plug>TaskList
let g:tlTokenList = ['TODO', 'FIXME']

"------------- Grep  ------------------
let Grep_Xargs_Options = '-0'
let Grep_Default_Filelist = '*.c *.cpp *.h *.hpp'


"------------- EasyAlign  ------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"------------- Tabularize  ------------------
"nnoremap <leader>a= :Tabularize /=<CR>
"vnoremap <leader>a= :Tabularize /=<CR>
"nnoremap <leader>a{ :Tabularize /{<CR>
"vnoremap <leader>a{ :Tabularize /{<CR>
"nnoremap <leader>a: :Tabularize /:\zs<CR>
"vnoremap <leader>a: :Tabularize /:\zs<CR>

"------------- vim-localvimrc ------------------
let g:localvimrc_ask = 0

"------------- ack/ag-silver_searcher ------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"------------- RAINBOW_LEVELS ------------------
nmap <leader>rl : RainbowLevelsToggle<CR>



"-------------- Functions ----------------
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd Filetype c,cpp,cc,cxx,h,hpp,hxx,python,ruby,java,bash,d autocmd BufWritePre <buffer> :call TrimWhiteSpace()

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
"noremap [q :cprev<CR> DISABLED as this is already provided by unimpaired plugin

" ']q' next quickfix entry
"noremap ]q :cnext<CR> DISABLED as this is already provided by unimpaired plugin

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



if has('mac')
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
endif

noremap <F1> :<C-u>ClangFormat<CR>
inoremap <F1> <ESC>:<C-u>ClangFormat<CR>i
vnoremap <F1> :ClangFormat<CR>
noremap <leader>cr :py3file ~/scripts/clang-rename.py<CR>

"Easy renaming of variables, see http://stackoverflow.com/questions/597687/changing-variable-names-in-vim
" For local replace
"nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
"nnoremap gR gD:%s/<C-R>///gc<left><left><left>

"Better version: https://gist.github.com/AndrewRayCode/048616a2e3f5d1b5a9ad
function! Refactor()
    call inputsave()
    let @z=input("What do you want to rename '" . @z . "' to? ")
    call inputrestore()
endfunction

" Locally (local to block) rename a variable
nmap <Leader>rfc "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/gc<cr>`x



" Automatic relative/absolute line numbers
"autocmd WinEnter,FocusGained *  :setlocal relativenumber
"autocmd WinLeave,FocusLost *    :setlocal norelativenumber
"autocmd InsertEnter *           :setlocal norelativenumber
"autocmd InsertLeave *           :setlocal relativenumber

function! g:ToggleNuMode()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>ln :call g:ToggleNuMode()<CR>


" Remove scoping/condition and reindent
function! g:DeBlock()
    :normal di}d2k"2Pma=i}'a
endfunction

nnoremap <leader>db :call DeBlock()<CR>
