"Modified on 19th Aug 2021
"Test if this is reflected on the other file
"Hello World
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" "
" " let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
"" All of your Plugins must be added before the following line
call vundle#end()            " required
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'vim-syntastic/syntastic'

" Autoindentation for python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'vim-airline/vim-airline'
" "
""" YouCompleteMe
""let g:ycm_key_list_previous_completion=['<Up>']
" make YCM compatible with UltiSnips (using supertab)
""let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
""let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
""let g:SuperTabDefaultCompletionType = '<C-n>'
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"python with virtualenv support
py3 3
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  #exec(compile(open(activate_this,"rb").read(),activate_this,'exec'), dict(__file__=activate_this))
EOF

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

set number
set showcmd
set incsearch
set hlsearch
set autoindent
set ruler
set history=30
set cursorline
set fdm=marker
hi CursorLine term=bold cterm=bold guibg=Grey40
filetype plugin indent on
filetype plugin on
set cmdheight=5
"color xterm16
"Select colormap: 'soft', 'softlight','standard' or 'allblue'
let xterm16_colormap = 'allblue'
let xterm16_brightness = 'default'
let python_highlight_all=1
syntax on
set smartindent
set wildmenu
set showmode
set visualbell
"localleader setting
let maplocalleader = ","

" to save Ctrl+s
" <CR> is for carriage return, this does not work when vi is invoked from a
" terminal, for the terminal interprets ctrl+s rather than that instance of
" vim
noremap  <localleader>s :w<CR>a
inoremap <localleader>s <esc>:w<CR>a
" ctrl + w will delete a word to the left of the cursor and gets back to
" append mode.
noremap <localleader>w bdwa
inoremap <localleader>w <esc>bdwa
"remapping for deleting line
noremap <localleader>d dd
"remapping to make easier editing of this file
noremap <localleader>ev :tabnew $MYVIMRC<cr>G$a
"remapping to sourcing easier
noremap <localleader>sv :source $MYVIMRC<cr>
"few abbreviations
iabbrev @@ gnanasenthil654321@gmail.com
iabbrev adn and
iabbrev wehn when
iabbrev teh the
"surround a word with double quotes
nnoremap <localleader>' viw<esc>bi"<esc>ea"
"surround a line with double quotes
nnoremap <localleader>" 0i"<esc>$a"
"for fold creation
" use j and k to change to normal mode 
inoremap jk <esc>
" Pressing carriage return key writes the file to the disk
inoremap <cr> <esc>:w<cr>a<cr>


augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup pythonFold
  autocmd!
  autocmd Filetype *.py set foldmethod=indent
  autocmd BufNewFile,BufReadPre,BufRead *.py 
			  \ set encoding=utf-8 |
			  \ set foldmethod=indent | 
			  \ set foldlevel=99 |
			  \ set tabstop=4 |
			  \ set softtabstop=4 |
			  \ set shiftwidth=4 |
			  \ set textwidth=79 |
			  \ set expandtab |
			  \ set autoindent |
			  \ set fileformat=unix 

  "autocmd FileType python nnoremap <buffer> <localleader>f i#{{{<cr>#}}}<esc>k4li
  "autocmd BufEnter *.py nnoremap <buffer> <localleader>f i#{{{<cr>#}}}<esc>k4li
			  
augroup END

augroup beamer
  autocmd!
  autocmd BufNewFile,BufReadPre *.tex filetype on
  autocmd BufNewFile *.tex 0r ~/Programming/vim/VimSkeletalCode/tex/skeleton.tex
  autocmd FileType tex nnoremap <localleader>f i%{{{<cr>%}}}<esc>k4li
  autocmd BufEnter *.tex nnoremap <localleader>i i\includegraphics[width=.8\textwidth,height=.8\textheight,keepaspectratio]{}<esc>i
augroup END

augroup octave
  autocmd!
  autocmd BufNewFile, BufReadPre, BufRead *.m set foldmethod=marker
  autocmd BufEnter *.m set foldmarker=%(((,%)))
  autocmd BufEnter *.m nnoremap <localleader>f i%(((<cr><cr>%)))<esc>k4li
augroup END
