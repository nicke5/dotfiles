"==============================================================================
" .vimrc
" Nick Southorn
"
"
"
"==============================================================================

"==============================================================================
" LOOK AND FEEL
" Turn on line numbers
set number
" Toggle line number and fold column for easy copying
nnoremap <F4> :set nonumber!<CR>: set foldcolumn=0<CR>

" Solarized Colors
syntax enable
set background=dark
colorscheme solarized


" Highlight excess line length
augroup vim_autocmds
	autocmd!
	" Highlight chars past column 120
	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
	autocmd FileType python match Excess /\%120v.*/
	autocmd FileType python set nowrap
augroup END

"" Powerline setup
let g:PowerLine_symbols = 'fancy'
set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2


" Prevent automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable code folding
" Use za to open and close a fold
set foldmethod=indent
set foldlevel=00


" Window splitting
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
" Switch windows: Ctrl+w + w


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Syntax highlighting and validation
syntax on                     " Syntax highlighting
filetype on                   " Try to detect filetypes
filetype plugin indent on     " Enable loading indent file for filetype

" sudo write! For when you've opened a file as read-only by mistake.

cnoremap sudow w !sudo tee % >/dev/null



"==============================================================================
" MODULE MANAGEMENT

" Pathogen
" call pathogen#helptags()
" execute pathogen#infect()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let vundle manage vundle
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
"
filetype plugin indent on

"==============================================================================
" MODULE SPECIFIC SETTINGS

" Task lists
map <leader>td <Plug>TaskList

" Gundo
" map <leader>g :GundoToggle<CR>
nnoremap <F3> :GundoToggle<CR>

" PyFlakes
" Will notify you about unused imports and invalid syntax
let g:pyFlakes_use_quickfix = 0

" SnipMate
filetype plugin on

"s Tab completion
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"

"set completeopt=menuone,longest,preview

" NERDTree file browser
" Use F2 
map <F2> :NERDTreeToggle<CR>


" Searching
nmap <leader>a <Esc>:Ack!








"==============================================================================
" GIT SPECIFIC SETTINGS
" Integration with git

" Gblame: This allows you to view a line by line comparison of who the last person to touch that line of code is.
" Gwrite: This will stage your file for commit, basically doing git add <filename>
" Gread: This will basically run a git checkout <filename>
" Gcommit: This will just run git commit. Since its in a vim buffer, you can use keyword completion (Ctrl-N), like test_all<Ctrl-N> to find the method name in your buffer and complete it for the commit message. You can also use + and - on the filenames in the message to stage/unstage them for the commit.


"==============================================================================
" PYTHON SPECIFIC SETTINGS
" PEP8
" Ensures consistency of code
let g:pep8_map='<leader>8'

" Rope
let g:pymode_rope = 1
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Execute file being edited with <shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
