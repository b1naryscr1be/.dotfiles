"====================================================================="
" Install vim-plug:                                                   "
"                                                                     "
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \                  "
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim "
"====================================================================="

"===================================="
"  __ _  ___ _ __   ___ _ __ __ _| | "
" / _` |/ _ \ '_ \ / _ \ '__/ _` | | "
"| (_| |  __/ | | |  __/ | | (_| | | "
" \__, |\___|_| |_|\___|_|  \__,_|_| "
" |___/                              "
"===================================="

"=== disable compatibility with vi ==="
set nocompatible

"=== syntax highlighting ==="
syntax enable

"=== detect filetypes and load relevant plugins ==="
filetype on
filetype plugin on
filetype indent on

"=== show relative line numbers ==="
set nu
set rnu

"=== disable annoying error bells ==="
set noerrorbells
set novisualbell

"=== tabs & indentation ==="
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set smarttab

"=== encoding ==="
set filetype=unix
set encoding=utf-8

"=== show commands and various info in the status bar ==="
set showcmd
set laststatus=2
set cmdheight=1
set ruler
set wildmenu

"=== search stuff ==="
set incsearch
set smartcase
set nohlsearch
set showmatch

"=== miscellaneous ==="
set scrolloff=8
set history=1024
set colorcolumn=80
set mouse=a
runtime ftplugin/man.vim
let g:ft_man_open_move='vert'
"set keywordprg=:Man

"=== make undo persistent ==="
try
	if !isdirectory($HOME."/.vim/undodir")
		call mkdir($HOME.".vim/undodir", "p", 0700)
	endif
	set undodir=~/.vim/undodir
	set undofile
catch
endtry

"=== Russian keymap ==="
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"============================================="
"             _                           _   "
"  __ _ _   _| |_ ___   ___ _ __ ___   __| |  "
" / _` | | | | __/ _ \ / __| '_ ` _ \ / _` |  "
"| (_| | |_| | || (_) | (__| | | | | | (_| |  "
" \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|  "
"============================================="

"=== preserve the cursor's last position when opening files ==="
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
								\ | exe "normal! g'\"" | endif

"=== update the current file if it was changed outside of vim ==="
set autoread
au FocusGained,BufEnter * silent! checktime

"=== source .vimrc on save ==="
au! BufWritePost ~/.vimrc source % 

"=== open NERDTree if no arguments are provided ===
au VimEnter * if !argc() | NERDTree | endif

"=================================="
"       _             _            "
" _ __ | |_   _  __ _(_)_ __  ___  "
"| '_ \| | | | |/ _` | | '_ \/ __| "
"| |_) | | |_| | (_| | | | | \__ \ "
"| .__/|_|\__,_|\__, |_|_| |_|___/ "
"|_|            |___/              "
"=================================="

call plug#begin()

Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'jmcantrell/vim-virtualenv'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'plasticboy/vim-markdown'
Plug 'ekalinin/dockerfile.vim'

call plug#end()

"============================="
"           _                 "
"  ___ ___ | | ___  _ __ ___  "
" / __/ _ \| |/ _ \| '__/ __| "
"| (_| (_) | | (_) | |  \__ \ "
" \___\___/|_|\___/|_|  |___/ "
"                             "
"============================="                            

"=== colorscheme ==="
set background=dark
colorscheme gruvbox

"=== transparent background ==="
au VimEnter * hi Normal guibg=NONE ctermbg=NONE

"================================================"
"                             _                  "
" _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___  "
"| '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __| "
"| | | | | | (_| | |_) | |_) | | | | | (_| \__ \ "
"|_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/ "
"                |_|   |_|            |___/      "
"================================================"

let mapleader=' '

"=== general ==="
nnoremap <leader>ev 	:e! ~/.vimrc<CR>
nnoremap <leader>m 		:make<CR>
nnoremap <leader>cd		:cd %:p:h<CR>:pwd<CR> 
nnoremap <leader>Q		:qa<CR>

"=== coding ==="
nnoremap <leader>cn		:cnext<CR>
nnoremap <leader>cp		:cprev<CR>
nnoremap <leader>cw		:cwindow<CR>

"=== NERDTree ==="
nnoremap <leader>nt 	:NERDTreeToggle<CR>

"=== fzf ==="
nnoremap <leader>fb		:Buffers<CR>
nnoremap <leader>ff		:Files<CR>

"======================================="
"           _                  _        "
" ___ _ __ (_)_ __  _ __   ___| |_ ___  "
"/ __| '_ \| | '_ \| '_ \ / _ \ __/ __| "
"\__ \ | | | | |_) | |_) |  __/ |_\__ \ "
"|___/_| |_|_| .__/| .__/ \___|\__|___/ "
"            |_|   |_|                  "
"======================================="

iab xdate <C-r>=strftime("%F %T")<CR>
