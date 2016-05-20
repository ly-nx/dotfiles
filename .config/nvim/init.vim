set background=dark

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set ttimeoutlen=50

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" close all buffers and exit (normal mode)

nmap <C-x> :qall!<cr>

menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251 <CR>

map <F10> :emenu Encoding.<TAB>

if has('win32')
    set guifont=Consolas:h12   " Win32.
elseif has('gui_macvim')
    set guifont=Monaco:h10     " OSX.
    set lsp=2
else
    set guifont=Monospace\ 12  " Linux.
endif

call plug#begin("~/.config/nvim/bundle")

Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'
call plug#end()

colorscheme gruvbox

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set showmatch
set showmode    "show current mode down the bottom
set incsearch   "find the next match as we type the search
set nohlsearch    "hilight searches by default
set ignorecase  "ignores case on search
set smartcase
set infercase
set completeopt=longest,menuone
set confirm
set number
set showbreak=...
set nowrap linebreak nolist
set textwidth=0
set wrapmargin=0
set colorcolumn=81
set cursorline
set ruler
set autoread
set autowriteall
set nostartofline
set list listchars=tab:··,trail:·,extends:»,precedes:«
" remove | from vertical windows separator bar
set fillchars+=vert:\ ,fold:-

" cyrillic letters fix, switch with Ctrl+^ in insert mode
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set laststatus=2

" indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set indentexpr=-1 " hack to avoid indent if indent function is not set (plain text, markdown, etc.)

"folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"turn on syntax highlighting
syntax on
set synmaxcol=120
syntax sync minlines=256

set grepprg=ag\ -S\ --nogroup\ --nocolor\ --skip-vcs-ignores\ --hidden\ --vimgrep
set grepformat=%f:%l:%c:%m

set wildignore+=*.o,*.obj,*/.sass-cache/*

" disable visualbell completely
set visualbell
set t_vb=

" enable all Python syntax highlighting features
let python_highlight_all = 1

let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 40
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_switch_buffer = '0'
let g:ctrlp_regexp = 0
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|nofile'
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")':   ['<c-n>'],
      \ 'PrtSelectMove("k")':   ['<c-p>'],
      \ 'PrtHistory(1)':       ['<up>'],
      \ 'PrtHistory(-1)':        ['<down>'],
      \ }

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor\/\(j\?ruby\|rbx\)\|vendor',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'bad_symbolic_link',
      \ }

let g:ctrlp_tjump_shortener = ['^/.*rbenv/versions/\d.\d.\d.*/lib/ruby/\(gems/\)\?\d.\d.\d/\|/.*/vendor/ruby/\d.\d.\d/', '.../']

let g:gitgutter_max_signs=5000
let g:gitgutter_eager=1
let g:gitgutter_realtime=1
let g:gitgutter_map_keys=0
let g:gitgutter_sign_column_always= 1

" airline config
let g:airline_section_b=0

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'gruvbox'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction

let g:neomake_error_sign = {
            \ 'text': '►',
            \ 'texthl': 'NeomakeError',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '►',
            \ 'texthl': 'NeomakeWarning',
            \ }

let g:neomake_verbose=0
let g:neomake_place_all_signs=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0