" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Core
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'blueyed/vim-diminactive'
Plug 'ervandew/supertab'
Plug 'junegunn/goyo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'

" Platform specific
Plug 'juliosueiras/vim-terraform-completion'
Plug 'm-kat/aws-vim'
Plug 'tpope/vim-markdown'

" Python
Plug 'zchee/deoplete-jedi'
Plug 'alfredodeza/pytest.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" ColorScheme
Plug 'whatyouhide/vim-gotham'
Plug 'ajmwagar/vim-deus'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-scripts/Zenburn'


" Initialize plugin system
call plug#end()

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

"""Theme
""""""""
colorscheme neodark

""" Base
""""""""
set t_Co=256
set encoding=utf-8
let mapleader = ","
set nofoldenable
set foldmethod=indent
set foldlevel=99

" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Enable folding with the spacebar
nnoremap <space> za
" fold all
nnoremap <Leader><space> zM
" unfold all
nnoremap <Leader><Leader><space> zR

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" save if no sudo
cmap w!! w !sudo tee % >/dev/null

" Ctrl c copy style in visual mode
vnoremap <C-c> :w !pbcopy<CR><CR>
vnoremap <C-x> :!pbcopy<CR>

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Save when losing focus
au FocusLost * :silent! wall
au InsertLeave * :silent! wall
set autowriteall
set autowrite

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

" mapping with faster reaction (defaut 1000)
set timeoutlen=500

""" Shortcuts
"""""""""""""

" Reload vim config file
nnoremap rr :so $MYVIMRC<CR>

" Yank from current cursor position to end of line
map Y y$

" better indentation
vnoremap < <gv
vnoremap > >gv


" Reload ALL
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>:bufdo e<cr>



""" Windows
"""""""""""

" cycle windows & buffers like browser
map <S-Tab> :bnext<CR>
map <Tab> <C-W>w

" Close all other buffers
map <silent> QQ :%bd\|e#<CR>

" Easy quitting current buffer
nnoremap <silent> qq :bdelete<CR>

" Windows limits
set winheight=30
set winwidth=90
silent! set winminheight=10
silent! set winminwidth=30

" Resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>


" window
nmap <leader><left>  :topleft  vnew<CR>
nmap <leader><right> :botright vnew<CR>
nmap <leader><up>    :topleft  new<CR>
nmap <leader><down>  :botright new<CR>
" buffer
noremap <leader><leader><left>   :leftabove  vnew<CR>
noremap <leader><leader><right>  :rightbelow vnew<CR>
noremap <leader><leader><up>     :leftabove  new<CR>
noremap <leader><leader><down>   :rightbelow new<CR>

""" Nerdtree
""""""""""""

autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden = 1

""" Vim-airline https://github.com/bling/vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
if has('linux')
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif


""" Ctrlp
"""""""""

let g:ctrlp_max_height = 12
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
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
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])


""" tagbar
""""""""""

nmap mt :TagbarToggle<CR>


""" easytags
""""""""""""

let g:easytags_always_enabled = 1
let g:easytags_auto_update = 1
let g:easytags_async = 1
" let g:easytags_events = ['BufWritePost']


""" vim-minimap
"""""""""""""""

let g:minimap_toggle='mm'
let g:minimap_highlight='ErrorMsg'

""" ALE
"""""""

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

""" Python Versions
"""""""""""""""""""

if has('macunix')
  let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
  let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
endif

" Arch
if has('linux')
  let g:python_host_prog = 'python2'
endif
