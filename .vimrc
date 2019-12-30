"=============================================================================#
"  _   _ _____ ____                                                           #
" | \ | | ____/ ___|    Nick Southorn                                         #
" |  \| |  _| \___ \    https://github.com/nicksouthorn                       #
" | |\  | |___ ___) |   n.southorn@gmail.com                                  # 
" |_| \_|_____|____/                                                          #
"                                                                             #
"=============================================================================#
" Description     :Vim configuration files
" Author	  :Nick Southorn
" Date            :30/12/19
" Version         :1.0    
" Usage		  :
" Notes           :                                         
" bash_version    :                      
"=============================================================================#
" => Global Settings
"=============================================================================#
set number
set nocompatible	
set showcmd
syntax enable
filetype on 
filetype plugin indent on 


" Window splitting
" Vertical Split : Ctrl+w + v
" Horizontal Split: Ctrl+w + s
" Close current windows: Ctrl+w + q
" Switch windows: Ctrl+w + w


" Prevent automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" sudo write! For when you've opened a file as read-only by mistake.

cnoremap sudow w !sudo tee % >/dev/null




"=============================================================================#
" => PLUGINS
"=============================================================================#
" Set the runtime path to include runtime and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'		  " Airline 
Plugin 'vim-airline/vim-airline-themes'		  " Airline Themes 
Plugin 'scrooloose/nerdtree'			  " NERDTree file manager
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'  " NERDTree highlighting
Plugin 'ryanoasis/vim-devicons' 		  " Add icons to NERDTree
Plugin 'vim-python/python-syntax'		  " Python syntax highlighting 
Plugin 'vimwiki/vimwiki'                          " Vim wiki 
Plugin 'ap/vim-css-color'                         " Color previews for CSS 
Plugin 'tpope/vim-surround'                       " Change surrounding marks 
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" All plugins must be added before the following line
call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use: 

" Brief help 
" :PluginList       - lists configured plugins 
noremap <F3> :PluginList<CR>
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate 
noremap <F4> :PluginInstall!<CR>: q<CR>
" :PluginSearch foo - searches for foo; append `!` to refresh local cache 
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal 
" see :h vundle for more details or wiki for FAQ 
" Put your non-Plugin stuff after this line


"=============================================================================#
" => PLUGIN: Airline  
"=============================================================================#
" Display all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1




"=============================================================================#
" => PLUGIN: NERDTree  
"=============================================================================#
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
" Open NERDTree automatically if vim is opened with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>			" Map CTRL+n to open NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1


" Workaround to get rid of ^G in NERDTree explorer
let g:NERDTreeNodeDelimiter = "\u00a0"

"=============================================================================#
" => PLUGIN: Python-syntax
"=============================================================================#
let g:python_highlight_all=1


"=============================================================================#
" => PLUGIN: VimWiki
"=============================================================================#
"Key bindings
" <Leader> = \
"Normal mode:
"
"    <Leader>ww -- Open default wiki index file.
"    <Leader>wt -- Open default wiki index file in a new tab.
"    <Leader>ws -- Select and open wiki index file.
"    <Leader>wd -- Delete wiki file you are in.
"    <Leader>wr -- Rename wiki file you are in.
"    <Enter> -- Follow/Create wiki link
"    <Shift-Enter> -- Split and follow/create wiki link
"    <Ctrl-Enter> -- Vertical split and follow/create wiki link
"    <Backspace> -- Go back to parent(previous) wiki link
"    <Tab> -- Find next wiki link
"    <Shift-Tab> -- Find previous wiki link
"
"For more keys, see :h vimwiki-mappings
"Commands
"
"    :Vimwiki2HTML -- Convert current wiki link to HTML
"    :VimwikiAll2HTML -- Convert all your wiki links to HTML
"    :help vimwiki-commands -- list all commands
"    :help vimwiki -- General vimwiki help docs
"

"=============================================================================#
" => PLUGIN: CSS-Color
"=============================================================================#
" A very fast, multi-syntax context-sensitive color name highlighter
" No config required

"=============================================================================#
" => PLUGIN: VIM-surround
"=============================================================================#
" Press cs"' inside
" "Hello world!"
" to change it to
" 'Hello world!'
" No config required

