set background=dark

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
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

" remap jk as esc
:inoremap jk <esc>
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

" sets search register, so highlight works only if hlsearch is on
function! HighlightUsages()
  let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
endfunction

" highligh word under cursor
nmap <Leader>h :call HighlightUsages()<cr>:set hls<cr>
" nohls
nmap <Leader>nh :set nohls<cr>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    autocmd BufRead,BufNewFile *.ts setfiletype typescript syntax=typescript
endif

" disable yaml and text autoindent
autocmd BufEnter * if &filetype == "yaml" | setlocal nosi inde= | endif
autocmd BufEnter * if &filetype == "text" | setlocal nosi inde= | endif
" Check syntax on save and when opening file

autocmd CursorHold,CursorHoldI *.py,*.rb,*.js,*.ts Neomake
autocmd BufReadPost,BufWritePost *.py,*.rb,*.js,*.ts Neomake

" auto save and link on exit from insert mode
" close all buffers and exit (normal mode)
nmap <C-x> :qall!<cr>

menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251 <CR>

map <F10> :emenu Encoding.<TAB>

if has('win32')
    set guifont=Consolas:h12   " Win32.
elseif has('gui_macvim')
    set guifont=Monaco:h10     " OSX.
else
    set guifont=Monospace\ 10  " Linux.
endif

call plug#begin("~/.config/nvim/bundle")

Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'scrooloose/nerdtree'
Plug 'nvie/vim-flake8'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'

"Plug 'scrooloose/syntastic'
call plug#end()

colorscheme gruvbox

set splitbelow
set splitright

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
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|copen|redraw!
" searches for the text under the cursor and shows the results in a quickfix window
nnoremap \ :silent grep! "\b<C-R>=expand("<cword>")<cr>\b"<CR>:cw<CR>:redraw!<cr>
vnoremap \ "hy:silent grep! "\b<C-r>h\b"<CR>:cw<CR>:redraw!<cr>

set wildignore+=*.o,*.obj,*/.sass-cache/*

" disable visualbell completely
set visualbell
set t_vb=

map <F9> :NERDTreeToggle<CR>

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

let g:NERDTreeWinSize=40
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDSpaceDelims=1
let g:NERDRemoveExtraSpaces = 1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeSortHiddenFirst=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMapCWD=""
let g:NERDTreeCascadeOpenSingleChildDir=0

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

" see .agignore
let g:ctrlp_custom_ignore = {
      \ 'dir':  '',
      \ 'file': '',
      \ 'link': '',
      \ }

let g:ctrlp_tjump_shortener = ['^/.*rbenv/versions/\d.\d.\d.*/lib/ruby/\(gems/\)\?\d.\d.\d/\|/.*/vendor/ruby/\d.\d.\d/', '.../']

let g:gitgutter_max_signs=5000
let g:gitgutter_eager=1
let g:gitgutter_realtime=1
let g:gitgutter_map_keys=0
let g:gitgutter_sign_column_always= 1

let g:gruvbox_invert_selection=0
let g:gruvbox_bold=0

" airline config

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

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'gruvbox'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction

" let g:airline_enable_syntastic=1
" show name of branch
let g:airline_enable_fugitive=1
" do not show the number of changed lines
let g:airline#extensions#hunks#enabled = 0

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

"let g:neomake_python_enabled_makers = ['flake8', 'pyflakes', 'pylint']
let g:neomake_python_enabled_makers = ['flake8']
"set path to flake8 in neovim's python 3 virtualenv for Neomake
let g:neomake_python_flake8_maker = {
  \ 'exe': '/Users/lynx/.config/nvim/env/bin/flake8'
  \ }
let g:neomake_javascript_enabled_makers=['eslint']
"typescript
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_typescript_tslint_maker = {
    \ 'args': ['%:p'],
    \ 'errorformat': 'ERROR: %f[%l\, %c]: %m',
    \ }
                                                                                                       
hi NeomakeError   ctermbg=237 guibg=#3c3836 ctermfg=167 guifg=#fb4934
hi NeomakeWarning ctermbg=237 guibg=#3c3836 ctermfg=172 guifg=#d79921

let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:python_host_prog = '/Users/lynx/.config/nvim/env2/bin/python' 
let g:python3_host_prog = '/Users/lynx/.config/nvim/env/bin/python'

" jsx also with .js files
let g:jsx_ext_required = 0

" replace selected text
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

nmap <Leader>b :CtrlPBuffer<cr>

" searches for the text under the cursor and shows the results in a quickfix window
nnoremap K :silent grep! "\b<C-R>=expand("<cword>")<cr>\b"<CR>:cw<CR>:redraw!<cr>
vnoremap K "hy:silent grep! "\b<C-r>h\b"<CR>:cw<CR>:redraw!<cr>

" different cursors for normal and insert mode
let guicursor=1

" vim-indent-guides
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'text']

hi IndentGuidesOdd  ctermbg=236 guibg=#333333
hi IndentGuidesEven ctermbg=236 guibg=#363636

let g:terminal_color_0 = "#282828"
let g:terminal_color_8 = "#928374"

" neurtral_red + bright_red
let g:terminal_color_1 = "#cc241d"
let g:terminal_color_9 = "#fb4934"

" neutral_green + bright_green
let g:terminal_color_2 = "#98971a"
let g:terminal_color_10 = "#b8bb26"

" neutral_yellow + bright_yellow
let g:terminal_color_3 = "#d79921"
let g:terminal_color_11 = "#fabd2f"

" neutral_blue + bright_blue
let g:terminal_color_4 = "#458588"
let g:terminal_color_12 = "#83a598"

" neutral_purple + bright_purple
let g:terminal_color_5 = "#b16286"
let g:terminal_color_13 = "#d3869b"

" neutral_aqua + faded_aqua
let g:terminal_color_6 = "#689d6a"
let g:terminal_color_14 = "#8ec07c"

" light4 + light1
let g:terminal_color_7 = "#a89984"
let g:terminal_color_15 = "#ebdbb2"