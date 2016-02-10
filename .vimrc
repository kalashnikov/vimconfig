"
" KKUO's VIMRC 
"
" Cleaned @ 2015.11.11
"
"
set clipboard=unnamed

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set t_Co=256

set hidden

set ic           " Search Ignore Case
set nu           " Show Line# 
set ruler		 " show the cursor position all the time
set showcmd		 " display incomplete commands
set incsearch	 " do incremental searching
set history=1000 " History Limit

set et ts=2
set tabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent 
set smartindent

set backup
set hlsearch
set helplang=cn

set backspace=indent,eol,start " Important!! Delete may result arraow cursor misfunction.

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let base16colorspace=256

syntax on

"============================================
"
"     Section 
"
"===========================================

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autocomplete
Plug 'ervandew/supertab'
" Execute the :UpdateRemotePlugins and restart Neovim.
" Then, execute the :DeopleteEnable<Paste>
Plug 'Shougo/deoplete.nvim'

" Tag
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'

" Language Support
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'

" Search
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Frontend
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'

" Misc
Plug 'edkolev/tmuxline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/Align'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'junegunn/goyo.vim'

call plug#end()

"=========================
" ColorScheme
"=========================
syntax enable
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1      " For Mac iTerm
"set guifont=Droid\ Sans\ Mono\ for\ Powerline.otf:h14
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

"let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
let g:Powerline_symbols = 'fancy'

"=========================

filetype off                  " required!
filetype plugin indent on     " required!

set encoding=utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
"set guifontwide=NSimsun:h12
"set guifontwide=Latha

set fencs=iso-2022-jp,sjis,euc-jp

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
" Signify 
" --------------------------
let g:signify_vcs_list = [ 'cvs', 'git' ]

" --------------------------
" vim-go 
" --------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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
"let g:airline_theme = 'badwolf'
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
" Goyo: distraction-free plugin
" --------------------------
" :Goyo
"   Toggle Goyo
nmap <leader>g :Goyo<CR> 
" :Goyo [dimension]
"   Turn on or resize Goyo
" :Goyo!
"   Turn Goyo off


" --------------------------
"  fzf: powerful fuzzy search  
" --------------------------
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

"=========================================================
" Search lines in all file opened
" https://github.com/junegunn/fzf/wiki/Examples-(vim)
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})
"=========================================================

map <silent> <Leader>f :FZFLines<CR>
map <silent> <Leader>ff :FZF<CR>

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

set pastetoggle=<leader>p

nmap <leader>nu :set nonu!<CR> 
nmap <leader>a :Startify<CR> 

if has('nvim')
  runtime! plugin/python_setup.vim
endif

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

"==================================================================
" Startify

autocmd User Startified setlocal cursorline

let g:deoplete#enable_at_startup      = 1

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
\ ['   LRU:'],
\ 'files',
\ ['   LRU within this dir:'],
\ 'dir',
\ ['   Sessions:'],
\ 'sessions',
\ ['   Bookmarks:'],
\ 'bookmarks',
\ ]

let g:startify_skiplist = [
          \ 'COMMIT_EDITMSG',
          \ 'bundle/.*/doc',
          \ ]

let g:startify_bookmarks = [
          \ { 'v': '~/.vimrc' },
          \ { 'z': '~/.zshrc' },
          \ { 'a': '~/.alias' },
          \ ]

let g:startify_custom_footer =
    \ ['', "   Do what make you happier.", '']

let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['']

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

" ===========================================================================

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
