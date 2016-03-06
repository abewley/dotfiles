""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plub with the following command:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Options after each 'Plug' command:
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |
"

if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

" Better highlighting of language tags
Plug 'skroll/vim-taghighlight'

" Color Schemes
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
let g:solarized_italic     = 0
let g:solarized_underline  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"

" Python support
Plug 'klen/python-mode'

" Better syntax highlighting for C++
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight           = 1

" Build System
Plug 'benekastah/neomake'
" open errors/warnings after building, but don't move cursor into quickfix
let g:neomake_open_list = 2
nmap <leader>mv :Neomake!<cr>

" C++ formatter
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'
autocmd FileType h,hpp,c,cpp,cu nnoremap <Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType h,hpp,c,cpp,cu vnoremap <Leader>cf :ClangFormat<CR>
autocmd FileType h,hpp,c,cpp,cu map <Leader>x <Plug>(operator-clang-format)
nmap <Leader>C :ClangFormatAutoToggle<CR>
let g:clang_format#code_style = "google"

" Quick switching between C/C++ header/implemntation
Plug 'derekwyatt/vim-fswitch'
map <Leader>of :FSHere<CR>
au BufEnter *.h,*.hpp,*.hh,*.cuh let b:fswitchdst  = 'cpp,cc,cu'
au BufEnter *.h,*.hpp,*.hh,*.cuh let b:fswitchlocs = 'reg:/include.*/src/'
au BufEnter *.cpp,*.cc,*.cu let b:fswitchdst  = 'h,hpp,hh,cuh'
" in the file's path, replace *last* occurance of 'src' with 'include'
au BufEnter *.cpp,*.cc,*.cu let b:fswitchlocs = 'reg:|src\(.*src\)\@!|include/**'

" Color parentheses differently to make matching easier
Plug 'oblitum/rainbow'
let g:rainbow_active = 1 " Turn on rainbow parentheses for all file types

" Commonly-accept default vim conifuration
Plug 'tpope/vim-sensible'

" Much better statusline
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled    = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline_powerline_fonts               = 1
let g:airline#extensions#tabline#fnamemod = ':t' " Only display buffer filename

" Better session memory
Plug 'tpope/vim-obsession'

" Tmux plugins (airline integration & quick command window)
Plug 'edkolev/tmuxline.vim'
Plug 'benmills/vimux'
let VimuxUseNearest = 1

" Pandoc support
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
let g:pandoc#command#autoexec_on_writes = 1
"let g:pandoc#command#autoexec_command = "Pandoc! pdf --filter pandoc-zotxt --csl=ieee.csl --filter pandoc-citeproc"

" Latex support
Plug 'lervag/vim-latex'

" File system browser
Plug 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers = 1
let NERDTreeMinimalUI = 1
map <Leader>e :e .<CR>

" Align comments and other code snippets
" <leader>acom - align comments
" <leader>adec - align c declarations (1 var/line)
" <leader>afnc - ansi-style C function input arguments
" <leader>tsp - align on whitespace
" <leader>t= - align on '='
" <leader>t, - align on ','
Plug 'Align'

" Display ctags in a buffer
Plug 'darkwind-mt/vim-tagbar'
let g:tagbar_show_linenumbers = 1 " Show line numbers in the tagbar
nmap <Leader>t :TagbarToggle<CR>

" Lots of useful Git interface commands (e.g., :Gst)
Plug 'fugitive.vim'

" Displays +, -, or ~ in the margin of files f/changes since last git commit
Plug 'airblade/vim-gitgutter'
" Better search utility
Plug 'haya14busa/incsearch.vim'
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
Plug 'surround.vim'

" Highlight trailing whitespace. Use ':FixWhitespace' to remove.
Plug 'bronson/vim-trailing-whitespace'

" <leader>cA - add comment to end of line (<leader>ca - change type of comment)
" <leader>cs - 'sexy comment' selection
" <leader>cu - uncomment selection
" <leader>c$ - comment to the end of the line
" <leader>ci - flip comment status of each line
Plug 'scrooloose/nerdcommenter'

" Add useful inner/around objects (e.g., diw, 'delete inner argument' dia)
Plug 'kana/vim-textobj-user'
Plug 'gaving/vim-textobj-argument'

" Automatically close quotes, parens, brackets, etc. (<C-d> to get out)
Plug 'Raimondi/delimitMate'
imap <c-d> <Plug>delimitMateS-Tab
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr    = 1
let g:delimitMate_autoclose    = 1

" fuzzy search
Plug 'ctrlp.vim'
nmap <leader>be :CtrlPBuffer<cr>

" Easily jump around buffer -> see below configuration for key bindings
" <leader>j|K motions: line motions
" <leader>l|h motions: intra-line motions
" s - quick search in either direction (2 chars)
Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_smartcase   = 1 " Turn on case sensitive feature
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>h <Plug>(easymotion-linebackward)
nmap s <plug>(easymotion-s2)

" Edit multiple parts of a file at once (e.g., refactoring)
Plug 'terryma/vim-multiple-cursors'

" <c-w>o - toggle full-screen zoom of the current window
Plug 'vim-scripts/ZoomWin'

" Allows '.' to repeat commands for a varity of plugins (e.g. surround.vim)
Plug 'tpope/vim-repeat'

" Awesome autocompletion (below makes ycm compatable w/ultisnips and supertab)
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf           = 0
nmap <leader>gi :YcmCompleter GoToImprecise<cr>

" Autocompletion templates (compatable w/ycm and supertab)
Plug 'SirVer/ultisnips'
Plug 'darkwind-mt/vim-snippets'
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Allow multiple programs to use <tab> for autocompletion
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'

" Add plugins to runtimepath
call plug#end()

filetype plugin indent on " Automatic indention for files

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
set wrap " display wrapped lines (soft wrap)
set linebreak " do reasonable wrapping (e.g., on word boundaries)
set nolist " ensures wrapping is done on word boundaries
set textwidth=80 " hard wrap at this character ('0' for no hard wrapping)
set colorcolumn=81 " Show 1-character-wide, vertical line at this column

" Beginning-of-line options
set relativenumber " show relative line numbers
set tabstop=8     " Actual tab character takes take x spaces
set shiftwidth=2  " Width of automatic indents
set softtabstop=2 " Make the tab indent by x spaces
set expandtab     " Convert tabs to spaces
"set list " Display white space

" Color options
colorscheme Tomorrow-Night-Bright
syntax on " Syntax highlighting
set background=dark " dark or light
highlight ColorColumn ctermbg=LightBlue " color for the column line
highlight cursorline ctermbg=LightBlue
set cursorline

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
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
endif

if has("gui_running")
    " Which gui items to show, by default (m: menu, T: toolbar, t : tearoff)
    set guioptions=mt
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc Key Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  " W/o this, nvim doesn't allow a <c-h> binding
  nmap <bs> <c-w>h
  tnoremap <esc> <c-\><c-n>
  map <leader>crc :terminal $HOME/dotfiles/bootstrap.sh<cr>
else
  map <leader>crc :! $HOME/dotfiles/bootstrap.sh<cr>
endif
" Vimrc edit and load
map <leader>vrc :e $HOME/dotfiles/.vimrc<cr>
map <leader>w :w<cr>
map <leader>q :qa<cr>

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
autocmd BufNewFile,BufRead *.cu,*.cuh       set filetype=cuda.cpp.c.doxygen
autocmd BufNewFile,BufRead *.cpp,*.hpp,*.cc set filetype=cpp.c.doxygen
autocmd BufNewFile,BufRead *.c,*.h          set filetype=c.doxygen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Latex File Specialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.tex            set textwidth=0
autocmd FileType tex                        nested :TagbarOpen
map <leader>lm :VimuxRunCommand("latexmk -pdf -synctex=1 " . expand("%"))<CR>
map <leader>lc :VimuxRunCommand("latexmk -C")<CR>
map <leader>lx <leader>lm:VimuxRunCommand("displayline -r -b -g ". line(".") . " " . expand("%:r") . ".pdf")<CR>

