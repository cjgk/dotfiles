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
set statusline+=%{fugitive#statusline()}
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
set relativenumber
set numberwidth=5

" Match searces as typing
set incsearch

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

" Copy condensed SQL
let @s = "vip:j:.w ! perl -pe 'chomp' | xclip -selection clipboardu"
 
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

" Don't need to escape parentheses and shit
nnoremap / /\v
vnoremap / /\v

" Move movement
noremap ö l
noremap l k
noremap k j
noremap j h

" Agressive no backing up, should probably be changed on production servers
set nowritebackup nobackup noswapfile
set autoread

" Reselect visual block after in-/outdent
vnoremap < <gv
vnoremap > >gv

" No more Ex-mode!
map Q <Nop>

" Leaders
nmap <leader>s @s 
nmap <leader>l :set list!<CR>

set report=0

call pathogen#infect()

" Saving vimrc sources the buffer contents
au! BufWritePost .vimrc source %

" Load ctrlp
let g:ctrlp_working_path_mode = 0
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Set up Vdebug
let g:vdebug_options = {
\   "server": "0.0.0.0",
\   "break_on_open": 0,
\   "path_maps": {"/mnt/host_www/": "/home/stjk04/Code/Work/", "/usr/share/php5/libzend-framework-php" : "/home/stjk04/Code/Work/"}
\}
