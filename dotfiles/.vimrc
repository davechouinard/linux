"===============================================================================
" vim-plug
"===============================================================================
call plug#begin('~/.vim/plug')
Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
call plug#end()

"===============================================================================
" Basic setup
"===============================================================================
set pastetoggle=<C-l>
set backspace=2   " backspace deletes like most programs in insert mode
set nobackup      " switch off automatic creation of backup files
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " always display the status line
set number        " display line numbers
set ignorecase    " case insensitive search
let &t_Co=256
syntax on
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set nofoldenable
set fillchars+=vert:\ 

" Quicker movement for splits
nnoremap H <c-w>h
nnoremap T <c-w>j
nnoremap N <c-w>k
nnoremap S <c-w>l

" Setup extra language extensions
au BufNewFile,BufRead *.cft setlocal ft=yaml

" NERDTree, airline, colorscheme options
nmap <C-\> :NERDTreeToggle<CR>
" uncomment these next two if nerdtree arrow fonts don't work
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = 'v'

" Tagbar
let g:tagbar_type_ansible = {
        \ 'ctagstype' : 'ansible',
        \ 'kinds' : [
                \ 't:tasks'
        \ ],
        \ 'sort' : 0
\ }

nmap <C-y> :TagbarToggle<CR>

let g:ctrlp_map = '<c-u>'
let g:ctrlp_cmd = 'CtrlP'

" comment out the next line if powerline fonts don't work
let g:airline_powerline_fonts = 1

let base16colorspace=256  " Access colors present in 256 colorspace

"colorscheme dracula
"colorscheme base16-monokai
"colorscheme base16-nord
"colorscheme base16-onedark
"colorscheme base16-solarized-dark
"colorscheme base16-tomorrow-night

set background=dark
