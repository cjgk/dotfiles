syntax on
set encoding=utf8
set t_Co=256 
set hls
set bs=2 
set ignorecase smartcase
set shm=at
set notitle
set hid "Change buffer without saving

call plug#begin('~/.local/share/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'StanAngeloff/php.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
call plug#end()

set background=dark

let g:solarized_termcolors=16
colorscheme solarized

filetype plugin indent on   

" Overworked statusline
set statusline=%F          " Filename
set statusline+=%m         " Modified?
set statusline+=%r         " Readonly?
set statusline+=%=         " Separator
set statusline+=[%{&ff},   " File format and encoding
set statusline+=%{strlen(&fenc)?&fenc:'none'},
set statusline+=%y]
set statusline+=\ %3v,%3l/%L " Vertical pos,horisontal pos/totalrows
set laststatus=2


" Show ruler (unnecessary if having statusline?), current mode, line number 
set ruler
set showmode
set number
set numberwidth=5

" Match searces as typing
set incsearch

" Autoindent, indentation steps, show active line
set autoindent smartindent
set shiftwidth=4 tabstop=4 softtabstop=4
set expandtab
set history=400

" Remove delays after hitting ESC
set timeout timeoutlen=1000 ttimeoutlen=10


" Tab completion when opening new file
set wildmode=longest,list,full
set wildmenu

" No idea
set so=15

set noerrorbells
set novisualbell
set t_vb=

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Ignore whitespace when in diff mode
set diffopt+=iwhite

" A little bit of mapping
"imap <F10> <C-x><C-o>
nmap <Space> za
set pastetoggle=<F3> 
inoremap jj <ESC>
nnoremap <NL> i<CR><ESC>
map <F1> <Esc>
imap <F1> <Esc>

" Correct my fat finger fibbles
:command! W w
:command! Q q
:command! B b
:command! Bd bd

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
let mapleader = ","
nmap <leader>o :Files<CR>
nmap <leader>s @s 
nmap <leader>l :set list!<CR>
nmap <leader>n :noh<CR>
nmap <leader>ö :b#<CR>
nmap <leader>w :bd<CR>
nmap <leader>i :GoInstall<CR>
nmap <leader>r :GoRun<CR>
nmap <leader>b :GoBuild<CR>
nmap <leader>t :GoTest<CR>
nmap <leader>e :Vexplore<CR>


let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
au FileType go nmap <leader>i <Plug>(go-install)

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

set report=0
