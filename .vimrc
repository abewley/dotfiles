""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NeoBundle plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install NeoBundle with the following command:
"   curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Better highlighting of language tags
NeoBundle 'skroll/vim-taghighlight'

" Color Schemes
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'altercation/vim-colors-solarized'
let g:solarized_italic     = 0
let g:solarized_underline  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"

" Better syntax highlighting for C++
NeoBundle 'octol/vim-cpp-enhanced-highlight'
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight           = 1

" Color parentheses differently to make matching easier
NeoBundle 'oblitum/rainbow'
let g:rainbow_active = 1 " Turn on rainbow parentheses for all file types

" Commonly-accept default vim conifuration
NeoBundle 'tpope/vim-sensible'

" Much better statusline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_detect_whitespace             = 1
let g:airline_powerline_fonts               = 1
let g:airline#extensions#tabline#fnamemod = ':t' " Only display buffer filename

" Tmux plugins (airline integration & quick command window)
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'benmills/vimux'
let VimuxUseNearest = 0

" Pandoc support
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#command#autoexec_command = "Pandoc! pdf --filter pandoc-zotxt --csl=ieee.csl --filter pandoc-citeproc"

" File system browser
NeoBundle 'The-NERD-tree'
map <Leader>fe :NERDTreeToggle<CR>

" Align comments and other code snippets
" <leader>acom - align comments
" <leader>adec - align c declarations (1 var/line)
" <leader>afnc - ansi-style C function input arguments
" <leader>tsp - align on whitespace
" <leader>t= - align on '='
" <leader>t, - align on ','
NeoBundle 'Align'

" Display ctags in a buffer
NeoBundle 'darkwind-mt/vim-tagbar'
let g:tagbar_show_linenumbers = 1 " Show line numbers in the tagbar
nmap <Leader>t :TagbarToggle<CR>

" Lots of useful Git interface commands (e.g., :Gst)
NeoBundle 'fugitive.vim'

" Displays +, -, or ~ in the margin of files f/changes since last git commit
NeoBundle 'airblade/vim-gitgutter'

" Better search utility
NeoBundle 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" add the 'ys' command (e.g., ysiw' will surround the current word w/')
" or change type (e.g., cs"' changes double to single quotes)
NeoBundle 'surround.vim'

" Highlight trailing whitespace. Use ':FixWhitespace' to remove.
NeoBundle 'bronson/vim-trailing-whitespace'

" <leader>cA - add comment to end of line (<leader>ca - change type of comment)
" <leader>cs - 'sexy comment' selection
" <leader>cu - uncomment selection
" <leader>c$ - comment to the end of the line
" <leader>ci - flip comment status of each line
NeoBundle 'scrooloose/nerdcommenter'

" Add useful inner/around objects (e.g., diw, 'delete inner argument' dia)
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'gaving/vim-textobj-argument'

" Automatically close quotes, parens, brackets, etc. (<C-d> to get out)
NeoBundle 'Raimondi/delimitMate'
imap <c-d> <Plug>delimitMateS-Tab
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr    = 1
let g:delimitMate_autoclose    = 1

" fuzzy search
NeoBundle 'ctrlp.vim'

" Buffer explorer
NeoBundle 'fholgado/minibufexpl.vim'
nmap <Leader>be :MBEToggle<CR>

" Easily jump around buffer -> see below configuration for key bindings
" <leader>j|K motions: line motions
" <leader>l|h motions: intra-line motions
" s - quick search in either direction (2 chars)
NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_smartcase   = 1 " Turn on case sensitive feature
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)
nmap s <plug>(easymotion-s2)

" Edit multiple parts of a file at once (e.g., refactoring)
NeoBundle 'terryma/vim-multiple-cursors'

" <c-w>o - toggle full-screen zoom of the current window
NeoBundle 'vim-scripts/ZoomWin'

" Special handler of '.otl' files for to-do lists, outlines, etc.
NeoBundle 'vimoutliner/vimoutliner.git'

" Allows '.' to repeat commands for a varity of plugins (e.g. surround.vim)
NeoBundle 'tpope/vim-repeat'

" Awesome autocompletion (below makes ycm compatable w/ultisnips and supertab)
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf           = 0
nmap <leader>gd :YcmCompleter GoTo<cr>

" Autocompletion templates (compatable w/ycm and supertab)
NeoBundle 'SirVer/ultisnips'
NeoBundle 'darkwind-mt/vim-snippets'
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Allow multiple programs to use <tab> for autocompletion
NeoBundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'

" Allows external checkers to verify code syntax
" OpenCL Error checking if you have:
"   1) http://sourceforge.net/projects/clcc
"   2) Plugin 'Syntastic'
NeoBundle 'Syntastic'
NeoBundle 'petRUShka/vim-opencl.git'
let g:syntastic_cl_checkers              = ['vim-opencl']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

" NeoBundle cleanup
call neobundle#end()

" NeoBundle Required:
filetype plugin indent on " Automatic indention for files

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General File Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File options
set hidden " allow buffer switch without forcing file save
set encoding=utf-8 " Necessary to show Unicode glyphs
set nospell spelllang=en_gb " spell check *off* by default

" Fold options
set foldmethod=syntax
set foldcolumn=0 " show helper lines on left side
au BufRead * normal zR

" End-of-line options
set linebreak " do reasonable wrapping (e.g., on word boundaries)
set wrap " display wrapped lines (soft wrap)
set textwidth=80 " hard wrap at this character ('0' for no hard wrapping)
set colorcolumn=81 " Show 1-character-wide, vertical line at this column

" Beginning-of-line options
set relativenumber " show relative line numbers
set tabstop=8     " Actual tab character takes take x spaces
set shiftwidth=2  " Width of automatic indents
set softtabstop=2 " Make the tab indent by x spaces
set expandtab     " Convert tabs to spaces
set list " Display white space

" Color options
colorscheme Tomorrow-Night-Bright
syntax on " Syntax highlighting
set background=dark " dark or light
highlight ColorColumn ctermbg=darkgray " color for the column line

" Configuration load options
set exrc " Allow a custom .vimrc to be loaded from any directory
set secure " for non-default .vimrc files, don't allow risky commands

" Window options
set splitbelow " when opening a horizontal split, open the new one on the bottom
set splitright " when opening a vertical split, open the new one on the right

" Directory settings
set autochdir " Change the directory based on buffer file location

" Search Options
set ignorecase
set smartcase " only care about case if searching for an upper case letter
set hlsearch  " highlight search

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GUI Options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" only enable mouse in normal mode
if has('mouse') | set mouse=n | endif

if has("gui_win32")
    set guifont=Ubuntu\ Mono:h14
elseif has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 10
elseif has("gui_macvim")
    set guifont=Ubuntu\ Mono:h14
endif

if has("gui_running")
    " Which gui items to show, by default (m: menu, T: toolbar, t : tearoff)
    set guioptions=mt
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimrc edit and load
map <Leader>vrc :e ~/dotfiles/$MYVIMRC<CR>
map <Leader>crc :!~/dotfiles/bootstrap.sh<CR>

" Get rid of the arrow keys to learn better Vim habits
map  <up>    <nop>
map  <down>  <nop>
map  <left>  <nop>
map  <right> <nop>
imap <up>    <nop>
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>

" Intuitive movement even with soft line wraps
map j gj
map k gk

" Easer movement between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Y should yank to the end of the line
map Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" File type configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.cu,*.cuh       set ft=cuda.cpp.doxygen
autocmd BufNewFile,BufRead *.cpp,*.hpp,*.cc set ft=cpp.doxygen
autocmd BufNewFile,BufRead *.c,*.h          set ft=c.doxygen
autocmd BufNewFile,BufRead *.md             set ft=markdown

