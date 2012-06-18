set nocompatible

" Syntax coloring
syntax on

" Need this for work
set encoding=utf8

" 256 color and zenburn
set t_Co=256 
let g:zenburn_force_dark_Background = 1
colorscheme zenburn

" Highlight search 
set hls 

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

" Always show tabline
"set showtabline=2

" Show ruler (unnecessary if having statusline?), current mode, line number 
set ruler
set showmode
set number

" Match searces as typing
set incsearch

" Autoindent, indentation steps, show active line
set autoindent smartindent
set shiftwidth=4 tabstop=4
set cursorline
set history=400

" Tab completion when opening new file
set wildmenu

" No idea
set so=15
set hid "Change buffer without saving

set noerrorbells
set novisualbell
set t_vb=

" A little bit of mapping
nmap <F1> :tabp<CR>
nmap <F2> :tabn<CR>
set pastetoggle=<F3> 

" Correct my fat finger fibbles
:command W w
:command Q q

" Disable arrow keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
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

set report=0

fun! <SID>StripTrailingWhitespaces()
	let l = getpos(".")
	%s/\s\+$//e
	call setpos('.', l)
endfun
autocmd BufWritePre *.[cChH][cChH]?,*.php,*.py :call <SID>StripTrailingWhitespaces()

call pathogen#infect()

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
