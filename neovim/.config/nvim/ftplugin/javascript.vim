augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=indent
augroup END

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']

""" deoplete
""""""""""""

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
