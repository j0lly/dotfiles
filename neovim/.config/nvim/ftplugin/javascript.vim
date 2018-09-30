augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=indent
augroup END

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
