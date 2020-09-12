syntax on

set clipboard+=unnamedplus
set mouse=a
set path+=**
set notimeout
set nocompatible
set noswapfile
set background=light
set number relativenumber
set timeoutlen=500
set ttimeoutlen=50
set ruler
set numberwidth=5
set smarttab
set expandtab
set laststatus=2
set ignorecase
set cursorline
set wildmenu
set splitbelow
set splitright
set undofile
set undodir=~/.vim/undodir
set encoding=utf-8

set tabstop=4
set softtabstop=4
set shiftwidth=4

source ~/.config/nvim/coc-config.nvim

map z <Plug>Sneak_s
map Z <Plug>Sneak_S

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <C-q> m`A;<esc>``
nnoremap <C-s> m`A:<esc>``
nnoremap <C-c> m`A,<esc>``

let g:ycm_path_to_python_interpreter = '/usr/bin/python'

call plug#begin('~/.vim/plugged')
  Plug 'haishanh/night-owl.vim'
  Plug 'vim-scripts/bufpos'
  Plug 'zivyangll/git-blame.vim'
  Plug 'dpc/vim-smarttabs'
  Plug 'wadackel/vim-dogrun'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sebdah/vim-delve'
  Plug 'stamblerre/gocode'
  Plug 'Shougo/deoplete.nvim'
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
  Plug 'davidhalter/jedi'
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/bufexplorer.zip'
  Plug 'HerringtonDarkholme/yats'
  Plug 'othree/yajs.vim'
  Plug 'Quramy/tsuquyomi'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'craigemery/vim-autotag'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-vinegar'
  Plug 'mhinz/vim-startify'
  Plug 'jremmen/vim-ripgrep'
  Plug 'arcticicestudio/nord-vim'
  Plug 'dense-analysis/ale'
  Plug 'leafgarland/typescript-vim'
  Plug 'vim-python/python-syntax'
  Plug 'neoclide/coc.nvim'
  Plug 'luochen1990/rainbow'
  Plug 'jiangmiao/auto-pairs'
  Plug 'thinca/vim-quickrun'
  Plug 'justinmk/vim-sneak'
  Plug 'mechatroner/rainbow_csv'
  Plug 'gko/vim-coloresque'
  Plug 'mattn/emmet-vim'
  Plug 'ChristianChiarulli/codi.vim'
  Plug 'SirVer/ultisnips'
call plug#end()

highlight ALEError ctermbg=none cterm=underline
 
nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

let g:delve_backend = "native"
let g:delve_breakpoint_sign = "●"
let g:delve_tracepoint_sign = "◆"
let g:delve_enable_syntax_highlighting = 1
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" let g:deoplete#sources#go#gocode_binary = '$HOME/go/bin/gocode'

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:UltiSnipsUsePythonVersion = 3

set completeopt-=preview

if (has("termguicolors"))
  set termguicolors
endif

colorscheme night-owl
hi Normal ctermbg=none
highlight NonText ctermbg=none

let mapleader = "\<Space>"

nnoremap <Leader>q :bd!<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

let g:rainbow_active = 1

let python_highlight_all=1
let g:python_highlight_all = 1

let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#enabled=1

let g:syntastic_quiet_messages = { "type": "style" }

highlight Comment cterm=italic gui=italic

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_use_vimproc = 0
autocmd BufWritePost *.ts,*.tsx call tsuquyomi#asyncGeterr()

let g:user_emmet_leader_key=','

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-p> :FZF<CR>
nnoremap <C-o> :Explore<CR>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" *.js, *.ts, *.html, *.css, *.py, *.pyx
" au BufNewFile,BufRead *.ejs set syntax=on

let g:quickrun_config = {
      \'*': {
      \'outputter/buffer/split': ':10split'},}

let g:rainbow_conf = {
\	'guifgs': ['green', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\	}
\}

let g:syntastic_quiet_messages = { "regex": [
        \ '.*docstring.*',
        \ '.*naming.*',
        \ '.*unnecessary.*',
        \ '.*global.*',
        \ '.*nested.*',
        \ '.*-import.*',
        \ '.*multiple\-statements.*',
        \ '.*bare\-except.*',
        \ '.*line-too-long.*',
        \ '.*redefined-outer.*',
        \ '.*bad-indentation.*',
        \ '.*no *.random*. member.*',
        \ '.*anomalous-backslash.*',
        \ '.*line-too.*',
        \ '.*conform.*',
        \ ] }
