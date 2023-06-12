set nocompatible
set visualbell t_vb=
set noswapfile
set backspace=indent,eol,start

" No idea what these do
set showcmd
set nomodeline

" Set up plugins (use junegunn/vim-plug)
call plug#begin()

" Basic necessities
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" Language specific stuff
Plug 'JuliaEditorSupport/julia-vim'
Plug 'sheerun/vim-polyglot'
Plug 'edwinb/idris2-vim'

" Colorschemes
Plug 'sainnhe/sonokai'
" Plug 'sickill/vim-monokai'
Plug 'crusoexia/vim-monokai'


" Maybe install later
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'lervag/vimtex'
"Plug 'SirVer/ultisnips'
"Plug 'rust-lang/rust.vim'

call plug#end()

" Redundant lines, but we'll do them anyway
filetype plugin indent on
syntax on
syntax enable


" --- Color Scheme ---

set t_Co=256
set background=dark
set termguicolors
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_show_eob = 0
colorscheme sonokai
"colorscheme monokai

" Color the current line number differently
if exists('&cursorlineopt')
  set cursorlineopt=number
  set cursorline
endif


" Better split visuals
hi Normal ctermbg=None
hi VertSplit cterm=None
hi NonText ctermfg=8
set fillchars=vert:\│

" Line things
set number
set relativenumber

set scrolloff=3

set mouse=a



" Tab=2 is better fight me
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent

" Line wrapping/navigation
set wrap linebreak nolist

noremap j gj
noremap k gk
noremap $ g$
noremap ^ g^


" Extra Things

"map <s-Space> <localleader>
"map <Space> <leader>

"au FileType snippets setlocal noexpandtab nosmarttab
"au FileType fortran setlocal shiftwidth=3 tabstop=6
"
"au FileType java setlocal shiftwidth=4 tabstop=8
"au FileType asm setlocal shiftwidth=8 tabstop=8 noexpandtab

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

