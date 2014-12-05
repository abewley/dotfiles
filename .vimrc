set nocompatible " Use the full power of Vim!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vundle configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off " required for vundle configuration

" Make sure file paths are correct in Windows
set shellxquote=
set noshellslash

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Color Schemes
Plugin 'https://github.com/darkwind-mt/bluespec.git'
Plugin 'https://github.com/altercation/vim-colors-solarized'

" Autocompletion templates
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'https://github.com/darkwind-mt/snipmate-snippets.git'

" Misc plugins
Plugin 'Tagbar'
Plugin 'a.vim'
Plugin 'The-NERD-tree'
Plugin 'Align'
Plugin 'bufexplorer.zip'
Plugin 'fugitive.vim'
Plugin 'surround.vim'
Plugin 'ctrlp.vim'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
Plugin 'https://github.com/vim-scripts/VHDL-indent-93-syntax.git'
Plugin 'https://github.com/vimoutliner/vimoutliner.git'
Plugin 'clang-complete'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ZoomWin'

" Syntax highlighting
" Error checking if you have:
"   1) http://sourceforge.net/projects/clcc
"   2) Plugin 'Syntastic'
Plugin 'https://github.com/petRUShka/vim-opencl.git'

" Allows external checkers to verify code syntax
Plugin 'Syntastic'

call vundle#end()
filetype plugin indent on

" NOTE: you must ":set noshellslash" and hide minBufExpl before doing a
"       ":BundleInstall" command

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_italic=0
let g:solarized_underline=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

let g:syntastic_cl_checkers = ['vim-opencl']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General File Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " Syntax highlighting
set fileformat=unix " unix line endings
colorscheme solarized
set background=dark " dark or light
set foldmethod=syntax
set foldcolumn=0 " show helper lines on left side
set foldlevelstart=9999 " start with everything unfolded
set linebreak " do reasonable wrapping (e.g., on word boundaries)
set wrap " display wrapped lines (soft wrap)
set textwidth=80 " hard wrap at this character ('0' for no hard wrapping)
set encoding=utf-8 " Necessary to show Unicode glyphs
set relativenumber " show relative line numbers
set hidden " allow buffer switch without forcing file save
set ruler        " show row/col at bottom right of screen
set tabstop=8     " Actual tab character takes take x spaces
set shiftwidth=2  " Width of automatic indents
set softtabstop=2 " Make the tab indent by x spaces
set expandtab     " Convert tabs to spaces
set nolist
set spell  spelllang=en_gb" spell check by default
set colorcolumn=81 " Show 1-character-wide, vertical line at this column

" Window options
set splitbelow " when opening a horizontal split, open the new one on the bottom
set splitright " when opening a vertical split, open the new one on the right

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GUI Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_win32")
    set guifont=Ubuntu\ Mono:h10
elseif has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 10
elseif has("gui_macvim")
    set guifont=Ubuntu\ Mono:h14
endif

if has("gui_running")
    " Only enable mouse in normal mode
    set mouse=n 

    " Which gui items to show, by default (m: menu, T: toolbar, t : tearoff)
    set guioptions=mt

    "winsize 85 30 " the default windows size on startup
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>t :TagbarToggle<CR>
map <Leader>fe :NERDTreeToggle<CR>
map <Leader>vrc :e $MYVIMRC<CR>

map <Leader>lm :!latexmk % -pdf<CR>
map <Leader>lc :!latexmk % -C<CR>
map <Leader>lo :!open %:r.pdf<CR>

map <Leader>t4 :set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab<cr>
map <Leader>t2 :set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab<cr>

" Get rid of the arrow keys to learn better Vim habits
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"map j gj
"map k gk

" Easer movement between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Miscellaneous Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Options
set backspace=indent,eol,start " make backspace more powerful
set ofu=syntaxcomplete#Complete

" Directory settings
set autochdir " Change the directory based on buffer file location

" Search Options
set ignorecase
set smartcase " only care about case if searching for an upper case letter and
set hlsearch  " highlight search
set incsearch " show match while typing

" Cryptographic method 
" (use :X to ask encrypt current file)
" (will be automatically prompted for password when you open it later)
set cryptmethod=blowfish " Stronger than the default 'zip' method

