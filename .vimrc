""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"                             ~ :wq ~               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                   


" SETTINGS --------------------------------------------------------------- {{{
syntax on
set regexpengine=0
set encoding=utf8
scriptencoding utf-8

colorscheme molokai

filetype on
filetype plugin on
filetype indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap

set history=100

" Indentation
set autoindent
set smartindent

set incsearch
set ignorecase
set smartcase
set showcmd
set magic " regex stuff


" don't redraw when doing macros, good for performance
set lazyredraw


" highlight search stuff
set hlsearch


set number
set showmatch


" Don't edit any of these in vim
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" undo files that have already been saved
set undodir=~/.vim/backup
set undofile
set undoreload=1000

" close buffers when they are not in use
set hidden


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Turn off cowsay at startup screen
set shortmess=I

" Show lines for tab indentation
set list lcs=tab:\|\ 

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

	"Plug 'dense-analysis/ale'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'	
	Plug 'preservim/nerdcommenter'
	Plug 'preservim/nerdtree'
	Plug 'rbong/vim-crystalline'
	Plug 'jiangmiao/auto-pairs'
	Plug 'kien/rainbow_parentheses.vim' 
	Plug 'mhinz/vim-startify'
	Plug 'valloric/youcompleteme'
	Plug 'junegunn/fzf.vim'
	Plug 'ap/vim-css-color'

	" Load dev icons after nerd tree / crystalline
	Plug 'ryanoasis/vim-devicons'	

call plug#end()

" Plugin configs

" nerdtree
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" devicons
let g:webdevicons_enable_nerdtree = 1

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

let mapleader = ','

" ------ nnoremap ------
nnoremap <leader>, :nohlsearch<CR> " disable search highlighting

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" New line stuff
nnoremap o o<esc> 
nnoremap O O<esc>

" Window navigation stuff
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split window
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NerdTree stuff
nnoremap <leader>l :NERDTreeToggle<cr> 

" Fzf stuff
nnoremap ff :Files<cr>
nnoremap fg :Ag<cr>
nnoremap <leader>gg :GBrowse<cr>
nnoremap <leader>gf :GFiles<cr>
nnoremap <leader>gc :Commits<cr>


" ------ inoremap ------

" ------ vnoremap ------ 

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" folding stuff 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" STARTIFY --------------------------------------------------------------- {{{

let g:startify_bookmarks = [
  \ { 'z': '~/.zshrc' },
  \ { 'v': '~/.vimrc' },
  \ { 'h': '~/.config/hypr/' },
  \ { 'c': '~/coding/' },
  \ { 'u': '~/uni/' },
  \ ]

let g:startify_custom_header = [
  \ '          ____   ____.__                   ',
  \ '          \   \ /   /|__| _____            ',
  \ '  ______   \   Y   / |  |/     \    ______ ',
  \ ' /_____/    \     /  |  |  Y Y  \  /_____/ ',
  \ '             \___/   |__|__|_|  /          ',
  \ '                              \/           ',
  \]
let g:startify_lists = [
  \ { 'header': ['   Bookmarks'],      'type': 'bookmarks' },
  \ { 'header': ['   MRU'],            'type': 'files' },
  \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
  \ ]

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#Head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&fenc!=#""?&fenc:&enc}][%{&ff}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'hybrid'

set showtabline=2
set guioptions-=e
set laststatus=2



" }}}
