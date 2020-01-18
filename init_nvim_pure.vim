"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
let g:python_host_prog = '/opt/local/bin/python2.7'
"source ~/.vimrc


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/abigagli/develop/NEOVIM/./dein_plugin_manager//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/abigagli/develop/NEOVIM/./dein_plugin_manager/')
  call dein#begin('/Users/abigagli/develop/NEOVIM/./dein_plugin_manager/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/abigagli/develop/NEOVIM/./dein_plugin_manager//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': './install.sh' })
  call dein#add('junegunn/fzf')
  call dein#add('Shougo/deoplete.nvim', { 'build': ':UpdateRemotePlugins'})


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"--------------- neosnippet.vim ----------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"--------------- deoplete.nvim ----------------
let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#disable_auto_complete = 0
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"--------------- LanguageClient-neovim ----------------
set hidden
" 'cpp': ['/Users/abigagli/develop/sources/cquery/build/system/bin/cquery', '--language-server'],
" 'cpp': ['/Users/abigagli/LLVM-TOT/bin/clangd', '-enable-snippets']
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['/Users/abigagli/LLVM-TOT/bin/clangd']
			\ }
let g:LanguageClient_autoStart = 1
"let g:LanguageClient_trace = 'verbose'

"let g:LanguageClient_loadSettings = 1
" Use an absolute configuration path if you want system-wide settings
"let g:LanguageClient_settingsPath = '/Users/abigagli/develop/commprove/DPDKHub/.vim/settings.json'
set completefunc=LanguageClient#complete
"set completeopt+=preview

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
