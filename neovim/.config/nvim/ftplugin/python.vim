let python_highlight_all=1
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

""" ALE
"""""""
let b:ale_fixers = {'python': ['yapf']}

""" py.test
"""""""""""

nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><leader><Leader>f <Esc>:Pytest file looponfail<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>
nmap <silent><Leader>p <Esc>:Pytest method<CR>

""" Jedi
""""""""

let g:jedi#popup_select_first = 1
let g:jedi#use_tabs_not_buffers = 1

""" Pyenv Workaround
""""""""""""""""""""

let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
