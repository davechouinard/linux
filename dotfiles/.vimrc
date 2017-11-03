"===============================================================================
" Vundle Setup
"===============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"
Plugin 'pearofducks/ansible-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'


" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"===============================================================================
" basic setup
"===============================================================================
set pastetoggle=<C-p>
set backspace=2   " backspace deletes like most programs in insert mode
set nobackup      " switch off automatic creation of backup files
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set number        " display line numbers
set numberwidth=5
set ignorecase    " case insensitive search
let &t_Co=256
syntax on

"===============================================================================
" softtabs, 2 spaces
"===============================================================================
set tabstop=2
set shiftwidth=2
set expandtab

"===============================================================================
" quicker movement for splits (dvorak)
"===============================================================================
nnoremap H <c-w>h
nnoremap T <c-w>j
nnoremap N <c-w>k
nnoremap S <c-w>l

"===============================================================================
" Setup extra language extensions
"===============================================================================
au BufNewFile,BufRead *.cft setlocal ft=yaml

set encoding=utf-8

"===============================================================================
" NERDTree, tagbar, airline, colorscheme options
"===============================================================================
map <C-\> :NERDTreeToggle<CR>
" uncomment these next two if nerdtree arrow fonts are bad in your terminal
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = 'v'

nmap <F8> :TagbarToggle<CR>

" comment out the next line if powerline fonts don't work in your terminal
let g:airline_powerline_fonts = 1

" Solarized theme
"let g:airline_theme='solarized'
"colorscheme solarized

" One Dark theme
"let g:airline_theme='onedark'
"colorscheme onedark
"let g:onedark_termcolors=16

set background=dark
set nofoldenable
