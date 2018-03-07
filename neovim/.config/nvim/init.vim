" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Core
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'blueyed/vim-diminactive'
Plug 'vim-syntastic/syntastic'
Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'metakirby5/codi.vim'
Plug 'severin-lemaignan/vim-minimap'

" Platform specific
Plug 'juliosueiras/vim-terraform-completion'
Plug 'm-kat/aws-vim'
Plug 'zchee/deoplete-jedi'
Plug 'alfredodeza/pytest.vim'
Plug 'tpope/vim-markdown'

" ColorScheme
Plug 'whatyouhide/vim-gotham'
Plug 'ajmwagar/vim-deus'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-scripts/Zenburn'


" Initialize plugin system
call plug#end()


"""Theme
""""""""
colorscheme neodark

""" Base
""""""""

set t_Co=256
set encoding=utf-8
let mapleader = ","

" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" folding
set nofoldenable
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" fold all
nnoremap <Leader><space> zM
" unfold all
nnoremap <Leader><Leader><space> zR

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" save if no sudo
cmap w!! w !sudo tee % >/dev/null

" convert yml to json and vice-versa (https://www.npmjs.com/package/json2yaml and the opposite)
map <Leader>j :%! yaml2json<CR>
map <Leader>y :%! json2yaml<CR>

" Ctrl c copy style in visual mode
vnoremap <C-c> :w !pbcopy<CR><CR>
vnoremap <C-x> :!pbcopy<CR>
"vnoremap <C-C> :.w !pbcopy<CR><CR>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Save when losing focus
au FocusLost * :silent! wall

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" Useful settings
set history=700
set undolevels=700

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Removes highlight of your last search
nnoremap <F3> :set hlsearch!<CR>

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" sane buffer splitting
set splitbelow
set splitright


""" Shortcuts
"""""""""""""

" Yank from current cursor position to end of line
map Y y$

" better indentation
vnoremap < <gv
vnoremap > >gv


""" Visual & colors
"""""""""""""""""""

" Showing line numbers and length
set number  " show line numbers
" set tw=80   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=234

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red


""" Windows
"""""""""""

" cycle windows like browser
map <Tab> <C-W>w

" Windows limits
set winheight=30
set winwidth=90
silent! set winminheight=10
silent! set winminwidth=30

" Resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" window
nmap <leader><leader><left>  :topleft  vnew<CR>
nmap <leader><leader><right> :botright vnew<CR>
nmap <leader><leader><up>    :topleft  new<CR>
nmap <leader><leader><down>  :botright new<CR>
" buffer
noremap <leader><left>   :leftabove  vnew<CR>
noremap <leader><right>  :rightbelow vnew<CR>
noremap <leader><up>     :leftabove  new<CR>
noremap <leader><down>   :rightbelow new<CR>


" ============================================================================
" Python IDE Setup
" ============================================================================

let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4    |
    \ set softtabstop=4    |
    \ set shiftwidth=4    |
    \ set textwidth=80    |
    \ set expandtab    |
    \ set autoindent    |
    \ set fileformat=unix


" ============================================================================
" WEB IDE Setup
" ============================================================================
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2    |
    \ set softtabstop=2    |
    \ set shiftwidth=2


" ============================================================================
" YAML IDE Setup
" ============================================================================
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" ============================================================================
" Markdown IDE Setup
" ============================================================================
let g:vim_markdown_folding_style_pythonic = 1


""" Syntastic
"""""""""""""

" for generic syntax checks
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pep257', 'pep8', 'python']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


""" Codi https://github.com/metakirby5/codi.vim
""""""""

" nmap <C-c> :Codi!!<CR>
" let g:codi#autoclose = 1


""" Nerdtree
""""""""""""

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden = 1


""" py.test
"""""""""""

" nmap <silent><Leader>f <Esc>:Pytest file<CR>
" nmap <silent><leader><Leader>f <Esc>:Pytest file looponfail<CR>
" nmap <silent><Leader>c <Esc>:Pytest class<CR>
" nmap <silent><Leader>m <Esc>:Pytest method<CR>
" nmap <silent><Leader>s <Esc>:Pytest session<CR>


""" vim-tdd
"""""""""""

let g:tdd_map_callback = 'python_tdd#map'
let g:tdd_test_command = 'py.test'


""" Jedi
""""""""

let g:jedi#popup_select_first = 1
let g:jedi#use_tabs_not_buffers = 1


""" Vim-airline https://github.com/bling/vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2


""" Ctrlp
"""""""""

let g:ctrlp_max_height = 12
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


""" Fugitive
""""""""""""

nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gvdiff<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gac :Gcommit --amen -v<CR>
nmap <leader>g :Ggrep


""" Goyo
""""""""

noremap <leader><leader><leader> y:Goyo<cr>


""" aws-cf
""""""""""

let g:AWSVimValidate = 1


""" deoplete
""""""""""""

let g:deoplete#enable_at_startup = 1


""" vim-minimap
"""""""""""""""

let g:minimap_toggle='mm'
