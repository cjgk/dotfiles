set nocompatible

" Syntax coloring
syntax on

" Need this for work
set encoding=utf8

" 256 color and zenburn
set t_Co=256 
"let g:zenburn_force_dark_Background = 1
colorscheme Tomorrow-Night

" Highlight search 
set hls

" Leader
let mapleader = ","

" Don't know what this means
"set sm

" Allow backspace over autoindent and line breaks
set bs=2 

" Dark background
set bg=dark

" Case insensitivity in searches
set ignorecase smartcase

" Avoid file message prompts
set shm=at

" Don't show a title
set notitle

" Overworked statusline
set statusline=%F          " Filename
set statusline+=%m         " Modified?
set statusline+=%r         " Readonly?
set statusline+=%=         " Separator
set statusline+=[%{&ff},   " File format and encoding
set statusline+=%{strlen(&fenc)?&fenc:'none'}]
set statusline+=\ %3v,%3l/%L " Vertical pos,horisontal pos/totalrows
set laststatus=2

" Show a line at 80 columns
set colorcolumn=80

" Show ruler (unnecessary if having statusline?), current mode, line number 
set ruler
set showmode
set number
set numberwidth=5

" Match searces as typing
set incsearch

" Don't need to escape parentheses and shit
nnoremap / /\v
vnoremap / /\v

" Autoindent, indentation steps, show active line
set autoindent smartindent
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab
set cursorline
set history=400

" Remove delays after hitting ESC
:set timeout timeoutlen=1000 ttimeoutlen=100

" Tab completion when opening new file
set wildmenu

" No idea
set so=15
set hid "Change buffer without saving

set noerrorbells
set novisualbell
set t_vb=

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Ignore whitespace when in diff mode
set diffopt+=iwhite

" A little bit of mapping
nmap <F1> :tabp<CR>
nmap <F2> :tabn<CR>
set pastetoggle=<F3> 
nnoremap <F4> :NumbersToggle<CR>
inoremap jj <ESC>

" Correct my fat finger fibbles
:command! W w
:command! Q q

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Agressive no backing up, should probably be changed on production servers
set nowritebackup nobackup noswapfile
set autoread

" Reselect visual block after in-/outdent
vnoremap < <gv
vnoremap > >gv

" No more Ex-mode!
map Q <Nop>

" Set ctrlp to not care about working path
let g:ctrlp_working_path_mode = 0

set report=0

"fun! <SID>StripTrailingWhitespaces()
"	let l = getpos(".")
"	%s/\s\+$//e
"	call setpos('.', l)
"endfun
" autocmd BufWritePre *.[cChH][cChH]?,*.php,*.py :call <SID>StripTrailingWhitespaces()

call pathogen#infect()

au! BufWritePost .vimrc source %
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Load ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
