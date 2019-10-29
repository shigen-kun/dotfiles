"dein Scripts-----------------------------
syntax enable
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/lin/.config/dein')
  call dein#begin('/Users/lin/.config/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/lin/.config/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#load_toml('/Users/lin/.config/dein/.cache/dein.toml', {'lazy': 0})
  call dein#load_toml('/Users/lin/.config/dein/.cache/dein_lazy.toml', {'lazy': 1})
  
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

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
"End dein Scripts-------------------------

"" Neoterm
set sh=zsh
set nocompatible
let g:neoterm_position = 'horizontal'

"" Ale
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" vim-table-mode
let g:table_mode_corner_corner='|'
let g:table_mode_header_fillchar='='

"" Keymap
inoremap <silent> jj <ESC>
nnoremap <silent> jj <Esc> :<C-u>set nohlsearch!<CR>

"" Character set
set fenc=utf-8

"" Looking
" Color scheme
colorscheme Tomorrow-Night
" Enable 256 color code
syntax enable
let base16colorspace=256
" Indent on setting
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
" Show command in status
set showcmd
" Set cusor line
set cursorline
set scrolloff=2
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
" Visualize beep sound
set visualbell
" Show () {} match
set showmatch
set matchtime=3
" Always show status line
set laststatus=2
set wildmenu
" Always show status bar
set laststatus=2
" Others
set number
set title
set ruler

"" Completion
set nocompatible
" Completion for command line
set history=1000
set wildmode=list:longest

"" Search setting
set hlsearch
set ignorecase
set smartcase
set incsearch
set wrapscan

"" Mouse
set mouse=a
set nomousefocus
set mousehide
set guioptions+=a

"" Others
set nobackup
set noswapfile
set autoread
set hidden
set clipboard=unnamed

"" Python
let g:python_host_prog = '/Users/lin/.pyenv/versions/2.7.14/bin/python2'
let g:python3_host_prog = '/Users/lin/.pyenv/versions/3.6.4/bin/python3'

"" terraform
let g:terraform_fmt_on_save = 1
