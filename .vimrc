"
" KKUO's VIMRC 
"
" Cleaned @ 2013.11.20
"
"


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set ic           " Search Ignore Case
set nu           " Show Line# 
set ruler		 " show the cursor position all the time
set showcmd		 " display incomplete commands
set incsearch	 " do incremental searching
set t_Co=256
set history=1000 " History Limit

set et ts=4
set tabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent 
set smartindent

set backup
set hlsearch
set helplang=cn

set backspace=indent,eol,start " Important!! Delete may result arraow cursor misfunction.

syntax on

"=========================
"
" ColorScheme
"
"=========================
syntax enable
"set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1      " For Mac iTerm
set guifont=Droid\ Sans\ Mono\ for\ Powerline.otf:h14
let g:Powerline_symbols = 'fancy'
let g:solarized_termcolors=256
colorscheme solarized


"==================================================================
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
endif " has("autocmd")

"==================================================================


" Pathogen Bundle Manager
execute pathogen#infect()

"============================================
"
"     Vundle Section 
"
"===========================================
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'wesleyche/SrcExpl'
Bundle 'scrooloose/nerdtree'
Bundle 'wesleyche/Trinity'

Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'ap/vim-css-color'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

set encoding=utf-8
set laststatus=2

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=./tags,tags;
set autochdir


"======================================================
"
"         Section for Plugin Hotkey Setting
" 
"======================================================

let mapleader = ","

" --------------------------
"  ack.vim
" --------------------------
" change the setting to use the_silver_searcher
"
" o    to open (same as enter)
" go   to preview file (open but maintain focus on ack.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window

" --------------------------
" mru.vim
" --------------------------
map <silent> <leader>m :MRU<cr>
let MRU_Max_Entries = 20


" --------------------------
" NERDTree 
" --------------------------
map <silent> <Leader>n :NERDTreeToggle<CR>


" --------------------------
" tabbar
" --------------------------
map <silent> <Leader>b :TagbarToggle<CR>
let g:tagbar_left = 1
"let g:tagbar_right = 1
let g:tagbar_width = 70


" --------------------------
" taglist
" --------------------------
map <silent> <leader>t :TlistToggle<cr>
let Tlist_WinWidth = 50
let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;c:class;g:enum;s:struct;u:union;f:function;o:todo;k:tricky'


" --------------------------
" ctrlp 
" --------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" --------------------------
"  vim-airline
" --------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'
" Fast-Switch to input-mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
set ttimeoutlen=50



" --------------------------
"  Trinity
" --------------------------
" Open and close all the three plugins on the same time 
nmap <leader>7  :TrinityToggleAll<CR> 
"
" " Open and close the Source Explorer separately 
nmap <leader>8  :TrinityToggleSourceExplorer<CR> 
"
" " Open and close the Taglist separately 
nmap <leader>9 :TrinityToggleTagList<CR> 
"
" " Open and close the NERD Tree separately 
nmap <leader>0 :TrinityToggleNERDTree<CR> 


"=========================================================
"
"       Key Mapping
"
"=========================================================

" indent
nmap <tab>   V>
nmap <s-tab> V<
xmap <tab>   >gv
xmap <s-tab> <gv

" Jump to begin/end of block 
nmap [] [{   
nmap ][ ]}

" Jump to next/previous tab
nmap '' gt
nmap ;; gT

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Move to other window
map mm <C-W><C-W>

" Use Shift-D & Shift-F for PageUp/PageDown
map <S-D> <C-B>
map <S-F> <C-F>

" Use q/o for Home/End
map q 0
map o $


" " Open and close the NERD Tree separately 
nmap <leader>nu :set nonu<CR> 

" ===========================================================================
"
" Best Vim Tips 
"
" ===========================================================================

" --------------------------
"  Exploring
" --------------------------
"   :Ex     : file explorer note capital Ex
"   \be     : builtin buffer explorer
"   :ls     : list of buffers(eg following)
"   :cd ..  : move to parent directory

" --------------------------
"  Great
" --------------------------
"   guu     : lowercase line
"   gUU     : uppercase line
"   ~       : invert case (upper->lower; lower->upper) of current character
"   gf      : open file name under cursor (SUPER)
"   ga      : display hex, ascii value of character under cursor
"   ggg?G   : rot13 whole file
"   xp      : swap next two characters around
"   CTRL-A,CTRL-X : increment, decrement next number on same line as the cursor
"   CTRL-R=5*5    : insert 25 into text
"   =             : (re)indent the text on the current line or on the area selected (SUPER)

" --------------------------
" Recording (BEST TIP of ALL)
" --------------------------
"   qq            : record keystrokes to register q
"   your commands
"   q             : quit recording
"   @q            : execute commands again
"   @@            : repeat
"   # editing a register/recording
"   "qp
"   <you can now see register contents, edit as required>
"   "add
"   @a
"   :%normal @q #execute the macro recorded in register q on all lines of the current file.
"   #or, with a visually selected set of lines:
"   :normal @q

" --------------------------
" Global command
" --------------------------
"   :g/^\s*$/d       : delete all blank lines
"   :g!/^dd/d        : delete lines not containing string
"   :v/^dd/d         : delete lines not containing string
"   :g/fred/,/joe/d  : not line based
"   :v/./.,/./-1join : compress empty lines
"   :'a,'b g/^Error/ . w >> errors.txt
"   :g/cmap\|form/p  : ORing

" Highlight Setting
"hi Search cterm=NONE ctermfg=DarkBlue ctermbg=Yellow
