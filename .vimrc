"=============================================================================#
"  _   _ _____ ____                                                           #
" | \ | | ____/ ___|    Nick Southorn                                         #
" |  \| |  _| \___ \    https://gitlab.com/nicksouthorn                       #
" | |\  | |___ ___) |   n.southorn@gmail.com                                  # 
" |_| \_|_____|____/                                                          #
"                                                                             #
"=============================================================================#
" Description     :Vim configuration files
" Author	  :Nick Southorn
" Date            :30/12/19
" Version         :1.3    
" Usage		  :
" Notes           :1.0 - .vimrc I've been using for years
" 	   	   1.1 - Added folding
"                  1.2 - 040121 - Updated folding config and added splits
"                        key mapping
"                  1.3 - Added ALE plugin and YAML customisations
" bash_version    :                      
"=============================================================================#

" => Global Settings " {{{
"set number
set relativenumber
set nocompatible	
set showcmd
syntax enable
filetype on 
filetype plugin indent on 

" Prevent automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" sudo write! For when you've opened a file as read-only by mistake.
cnoremap sudow w !sudo tee % >/dev/null
" }}}

"=> Splits and Tabbed Files " {{{
" :sp :vsp
set splitbelow splitright

" Remap splits navigation to CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes easier
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Switch between horizontal and vertical splits
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes that act as seperators on splits
set fillchars+=vert:\

" }}}

" => PLUGINS " {{{
" Plugins are managed by vundle, if not already installed then call:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Set the runtime path to include runtime and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
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
"Plugin 'valloric/youcompleteme'			  " 
Plugin 'dense-analysis/ale'			  " Asynchronous Lint Engine
Plugin 'Yggdroot/indentline'                      " Indentline visualisation
call vundle#end()

filetype plugin indent on

" Brief help 
" :PluginList       - lists configured plugins 
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate 
" :PluginSearch foo - searches for foo; append `!` to refresh local cache 
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal 
" see :h vundle for more details or wiki for FAQ 

noremap <F3> :PluginList<CR>
noremap <F4> :PluginInstall!<CR>: q<CR>
" }}}

" => PLUGIN: Airline " {{{ 
" Display all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
"}}}

" => PLUGIN: NERDTree " {{{ 
set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font\ 11
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
" Open NERDTree automatically if vim is opened with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>			" Map CTRL+n to open NERDTree
let g:NERDTreeDirArrowExpandable = 'â–¸'
let g:NERDTreeDirArrowCollapsible = 'â–¾'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1

" Workaround to get rid of ^G in NERDTree explorer
let g:NERDTreeNodeDelimiter = "\u00a0"
" }}}

" => PLUGIN: Python-syntax " {{{
let g:python_highlight_all=1
"}}}

" => PLUGIN: VimWiki " {{{
"=============================================================================#
let g:vimwiki_list = [{
	\ 'path': '~/Documents/notes/',
	\ 'template_path': '~/Documents/notes/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/Documents/notes/site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.tpl'}]


"Key bindings
"<Leader> = \
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

" }}}

" => PLUGIN: CSS-Color " {{{
" A very fast, multi-syntax context-sensitive color name highlighter
" No config required

" }}}

" => PLUGIN: VIM-surround " {{{
" Press cs"' inside
" "Hello world!"
" to change it to
" 'Hello world!'
" No config required
" }}}

" => Folding Configs "{{{
set foldmethod=marker
set foldmarker={{{,}}}
set foldlevel=00
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
" }}}

" => Customisations for C Development " {{{
"=============================================================================#
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
" }}}


" => Customisations for YAML Development " {{{
"=============================================================================#
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1
noremap <F6> :IndentLinesToggle<CR>
" }}}
