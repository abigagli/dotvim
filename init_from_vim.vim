set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python_host_prog = '/opt/local/bin/python2.7'
source ~/.vimrc

"Some convenience settings for easier :terminal experience
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
